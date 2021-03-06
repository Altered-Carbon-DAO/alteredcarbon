package alteredcarbon_test

import (
	"testing"

	keepertest "github.com/Altered-Carbon-DAO/alteredcarbon/testutil/keeper"
	"github.com/Altered-Carbon-DAO/alteredcarbon/x/alteredcarbon"
	"github.com/Altered-Carbon-DAO/alteredcarbon/x/alteredcarbon/types"
	"github.com/stretchr/testify/require"
)

func TestGenesis(t *testing.T) {
	genesisState := types.GenesisState{
		// this line is used by starport scaffolding # genesis/test/state
	}

	k, ctx := keepertest.AlteredcarbonKeeper(t)
	alteredcarbon.InitGenesis(ctx, *k, genesisState)
	got := alteredcarbon.ExportGenesis(ctx, *k)
	require.NotNil(t, got)

	// this line is used by starport scaffolding # genesis/test/assert
}
