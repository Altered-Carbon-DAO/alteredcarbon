package keeper_test

import (
	"context"
	"testing"

	keepertest "github.com/Altered-Carbon-DAO/alteredcarbon/testutil/keeper"
	"github.com/Altered-Carbon-DAO/alteredcarbon/x/alteredcarbon/keeper"
	"github.com/Altered-Carbon-DAO/alteredcarbon/x/alteredcarbon/types"
	sdk "github.com/cosmos/cosmos-sdk/types"
)

func setupMsgServer(t testing.TB) (types.MsgServer, context.Context) {
	k, ctx := keepertest.AlteredcarbonKeeper(t)
	return keeper.NewMsgServerImpl(*k), sdk.WrapSDKContext(ctx)
}
