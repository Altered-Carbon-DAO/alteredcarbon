package keeper_test

import (
	"context"
	"testing"

	sdk "github.com/cosmos/cosmos-sdk/types"
	keepertest "github.com/pariah140/alteredcarbon/testutil/keeper"
	"github.com/pariah140/alteredcarbon/x/alteredcarbon/keeper"
	"github.com/pariah140/alteredcarbon/x/alteredcarbon/types"
)

func setupMsgServer(t testing.TB) (types.MsgServer, context.Context) {
	k, ctx := keepertest.AlteredcarbonKeeper(t)
	return keeper.NewMsgServerImpl(*k), sdk.WrapSDKContext(ctx)
}
