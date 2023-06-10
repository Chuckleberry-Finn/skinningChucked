require "recipecode"

--[[
local originalCutFillet = Recipe.OnCreate.CutFillet
function Recipe.OnCreate.CutFillet(items, result, player) originalCutFillet(items, result, player) end


local originalCutFish = Recipe.OnCreate.CutFish
function Recipe.OnCreate.CutFish(items, result, player) originalCutFish(items, result, player) end
--]]


local originalCutAnimal = Recipe.OnCreate.CutAnimal
function Recipe.OnCreate.CutAnimal(items, result, player)

    --    local anim = nil;
    --    for i=0,items:size() - 1 do
    --        if instanceof(items:get(i), "Food") then
    --            anim = items:get(i);
    --            break;
    --        end
    --    end
    --    if anim then
    --        local new_hunger = anim:getHungChange() * 1.05;
    --        if(new_hunger < -100) then
    --            new_hunger = -100;
    --        end
    --        result:setBaseHunger(new_hunger);
    --        result:setHungChange(new_hunger);
    --
    --        result:setCustomWeight(true);
    --        result:setWeight(anim:getWeight() * 0.7);
    --        result:setActualWeight(anim:getActualWeight() * 0.7);
    --
    --        result:setLipids(anim:getLipids() * 0.75);
    --        result:setProteins(anim:getProteins() * 0.75);
    --        result:setCalories(anim:getCalories() * 0.75);
    --        result:setCarbohydrates(anim:getCarbohydrates() * 0.75);
    --    end

    originalCutAnimal(items, result, player)
end


function Recipe.OnGiveXP.Skinning10(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Skinning, 10);
end

function Recipe.OverWriteButcherToSkinningXP()

    local recipesToOverride = {"Butcher Small Animal", "Butcher Rabbit", "Butcher Bird",}-- "Slice Fillet"}

    local SM = getScriptManager()
    --local RM = SM:getAllRecipes()

    for _,recipeID in pairs(recipesToOverride) do
        ---@type JRecipe
        local recipe = SM:getRecipe(recipeID)
        if not recipe then
            print("ERR: OverWriteButcherToSkinningXP tried to find a recipe for `"..recipeID.."`!")
        else
            recipe:setLuaGiveXP("Recipe.OnGiveXP.Skinning10")
            recipe:setCategory("Skinning")
        end
    end
end

Events.OnGameBoot.Add(Recipe.OverWriteButcherToSkinningXP)