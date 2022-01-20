module github.com/Altered-Carbon-DAO/alteredcarbon

go 1.16

require (
	github.com/armon/go-metrics v0.3.10 // indirect
	github.com/cosmos/cosmos-sdk v0.44.5
	github.com/cosmos/go-bip39 v1.0.0
	github.com/cosmos/ibc-go/v2 v2.0.2
	github.com/gogo/protobuf v1.3.3
	github.com/google/go-cmp v0.5.6 // indirect
	github.com/gorilla/mux v1.8.0
	github.com/grpc-ecosystem/grpc-gateway v1.16.0
	github.com/pkg/errors v0.9.1
	github.com/spf13/cast v1.4.1
	github.com/spf13/cobra v1.2.1
	github.com/stretchr/testify v1.7.0
	github.com/tendermint/spm v0.1.9
	github.com/tendermint/tendermint v0.34.14
	github.com/tendermint/tm-db v0.6.4
	google.golang.org/genproto v0.0.0-20211208223120-3a66f561d7aa
	google.golang.org/grpc v1.43.0
)

require github.com/cosmos/ibc-go v1.2.5

replace (
	github.com/99designs/keyring => github.com/cosmos/keyring v1.1.7-0.20210622111912-ef00f8ac3d76
	github.com/cosmos/cosmos-sdk => github.com/cosmos/cosmos-sdk v0.44.5
	github.com/gin-gonic/gin => github.com/gin-gonic/gin v1.7.0
	github.com/gogo/protobuf => github.com/regen-network/protobuf v1.3.3-alpha.regen.1
	github.com/tendermint/spm => github.com/public-awesome/spm v0.1.9-stargaze.0.20220104183048-9259f3127531
	google.golang.org/grpc => google.golang.org/grpc v1.33.2
)
