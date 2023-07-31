local function OverWriteButcherToSkinningXP()

    local recipesToOverride = {"Butcher Small Animal", "Butcher Rabbit", "Butcher Bird", "Slice Fillet"}

    local SM = getScriptManager()
    --local RM = SM:getAllRecipes()

    for _,recipeID in pairs(recipesToOverride) do
        ---@type JRecipe
        local recipe = SM:getRecipe(recipeID)
        if not recipe then
            print("ERR: OverWriteButcherToSkinningXP tried to find a recipe for `"..recipeID.."`!")
        else
            print("skinningChucked: OverWriteButcherToSkinningXP: "..recipeID)
            recipe:setLuaGiveXP("Recipe.OnGiveXP.Skinning10")
            recipe:setCategory("Skinning")
        end
    end
end

Events.OnGameBoot.Add(OverWriteButcherToSkinningXP)