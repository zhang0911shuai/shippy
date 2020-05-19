package main

import (
	"context"
	pb "github.com/zhang0911shuai/shippy/proto/consignment"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"

	"log"
	"net"
	"sync"
)

const (
	port = ":50051"
)

type repository interface {
	Create(*pb.Consignment) (*pb.Consignment, error)
	GetAll() ([]*pb.Consignment, error)
}

type Repository struct {
	mu           sync.RWMutex
	consignments []*pb.Consignment
}

func (repo *Repository) Create(consignment *pb.Consignment) (*pb.Consignment, error) {
	repo.mu.Lock()
	defer repo.mu.Unlock()
	repo.consignments = append(repo.consignments, consignment)
	return consignment, nil
}

func (repo *Repository) GetAll() ([]*pb.Consignment, error) {
	return repo.consignments, nil
}

type service struct {
	repo repository
}

func (s *service) CreateConsignment(ctx context.Context, consignment *pb.Consignment) (*pb.Response, error) {
	consignment, err := s.repo.Create(consignment)
	if err != nil {
		return nil, err
	}
	return &pb.Response{Created: true, Consignment: consignment}, nil
}

func (s *service) GetConsignments(ctx context.Context, req *pb.GetRequest) (*pb.Response, error) {
	consignments, err := s.repo.GetAll()
	if err != nil {
		return nil, err
	}
	return &pb.Response{Consignments: consignments}, nil
}

func main() {
	repo := &Repository{}
	lis, err := net.Listen("tcp", port)
	if err != nil {
		log.Fatalf("failed to listen :%v", err)
	}

	s := grpc.NewServer()
	pb.RegisterShippingServiceServer(s, &service{repo})
	reflection.Register(s)
	log.Println("Running on port", port)
	err = s.Serve(lis)
	if err != nil {
		log.Fatalf("failed to serve:%v", err)
	}
}
