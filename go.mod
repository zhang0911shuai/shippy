module github.com/zhang0911shuai/shippy

go 1.14

replace (
	cloud.google.com/go => github.com/googleapis/google-cloud-go v0.56.0
	golang.org/x/crypto => github.com/golang/crypto v0.0.0-20200406173513-056763e48d71
	golang.org/x/exp => github.com/golang/exp v0.0.0-20200331195152-e8c3332aa8e5
	golang.org/x/image => github.com/golang/image v0.0.0-20200119044424-58c23975cae1
	golang.org/x/lint => github.com/golang/lint v0.0.0-20200302205851-738671d3881b
	golang.org/x/mobile => github.com/golang/mobile v0.0.0-20200329125638-4c31acba0007
	golang.org/x/net => github.com/golang/net v0.0.0-20200324143707-d3edc9973b7e
	golang.org/x/oauth2 => github.com/golang/oauth2 v0.0.0-20200107190931-bf48bf16ab8d
	golang.org/x/sync => github.com/golang/sync v0.0.0-20200317015054-43a5402ce75a
	golang.org/x/sys => github.com/golang/sys v0.0.0-20200409092240-59c9f1ba88fa
	golang.org/x/text => github.com/golang/text v0.3.2
	golang.org/x/time => github.com/golang/time v0.0.0-20191024005414-555d28b269f0
	golang.org/x/tools => github.com/golang/tools v0.0.0-20200409210453-700752c24408
	google.golang.org/api => github.com/googleapis/google-api-go-client v0.21.0
	google.golang.org/appengine => github.com/golang/appengine v1.6.5
	google.golang.org/genproto => github.com/google/go-genproto v0.0.0-20200409111301-baae70f3302d
	google.golang.org/grpc => github.com/grpc/grpc-go v1.28.1
)

require (
	github.com/golang/protobuf v1.4.2
	golang.org/x/net v0.0.0-20200519113804-d87ec0cfa476 // indirect
	golang.org/x/sys v0.0.0-20200519105757-fe76b779f299 // indirect
	google.golang.org/genproto v0.0.0-20200515170657-fc4c6c6a6587 // indirect
	google.golang.org/grpc v1.29.1
)
