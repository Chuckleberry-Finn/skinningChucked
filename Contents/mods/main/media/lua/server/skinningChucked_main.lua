require "recipecode"

--[[
local originalCutFillet = Recipe.OnCreate.CutFillet
function Recipe.OnCreate.CutFillet(items, result, player)
    originalCutFillet(items, result, player)
end
--]]

local originalCutFish = Recipe.OnCreate.CutFish
function Recipe.OnCreate.CutFish(items, result, player)

    --    local fish = nil;
    --    for i=0,items:size() - 1 doif instanceof(items:get(i), "Food") thenfish = items:get(i);break; end end
    --    if fish then
    --        local hunger = math.max(fish:getBaseHunger(), fish:getHungChange())
    --        result:setBaseHunger(hunger / 2);
    --        result:setHungChange(hunger / 2);
    --        result:setActualWeight((fish:getActualWeight() * 0.9) / 2)
    --        result:setWeight(result:getActualWeight());
    --        result:setCustomWeight(true)
    --        result:setCarbohydrates(fish:getCarbohydrates() / 2);
    --        result:setLipids(fish:getLipids() / 2);
    --        result:setProteins(fish:getProteins() / 2);
    --        result:setCalories(fish:getCalories() / 2);
    --        result:setCooked(fish:isCooked());
    --    end

    originalCutFish(items, result, player)
end


local originalCutAnimal = Recipe.OnCreate.CutAnimal
---@param player IsoPlayer|IsoGameCharacter
function Recipe.OnCreate.CutAnimal(items, result, player)

    --    local anim = nil;
    --    for i=0,items:size() - 1 do if instanceof(items:get(i), "Food") then anim = items:get(i); break;  end end
    --    if anim then
    --        local new_hunger = anim:getHungChange() * 1.05;
    --        if(new_hunger < -100) then new_hunger = -100;  end
    --        result:setBaseHunger(new_hunger);
    --        result:setHungChange(new_hunger);
    --        result:setCustomWeight(true);
    --        result:setWeight(anim:getWeight() * 0.7);
    --        result:setActualWeight(anim:getActualWeight() * 0.7);
    --        result:setLipids(anim:getLipids() * 0.75);
    --        result:setProteins(anim:getProteins() * 0.75);
    --        result:setCalories(anim:getCalories() * 0.75);
    --        result:setCarbohydrates(anim:getCarbohydrates() * 0.75);
    --    end

    local skinningLevel = player:getPerkLevel(Perks.Skinning)
    local success = 20 + (skinningLevel*5)
    local drops = {"skinningChucked.AnimalBones", "skinningChucked.LeatherScraps"}
    
    for drop=1, #drops do
        if ZombRand(100) < success then
            player:getInventory():AddItem(drops[drop])
        end
    end

    originalCutAnimal(items, result, player)
end


function Recipe.OnGiveXP.Skinning10(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Skinning, 10)
end