-- Will dump all content of you bags to a json

abotInventoryResult='[';
containerSlots=GetContainerNumSlots(b);
for b=0,4 do
	for s=1,containerSlots do
		abItemLink=GetContainerItemLink(b,s)
		if abItemLink then
			abCurrentDurability, abMaxDurability = GetContainerItemDurability(b, s);
			abCooldownStart, abCooldownEnd = GetContainerItemCooldown(b, s)
			abIcon, abItemCount, abLocked, abQuality, abReadable, abLootable, abItemLink, isFiltered = GetContainerItemInfo(b, s);
			abName,abLink,abRarity,abLevel,abMinLevel,abType,abSubType,abStackCount,abEquipLoc,abIcon,abSellPrice=GetItemInfo(abItemLink);
			abotInventoryResult=abotInventoryResult..
				'{'..
					'"id": "'..tostring(abId or 0)..'",'..
					'"count": "'..tostring(abItemCount or 0)..'",'..
					'"quality": "'..tostring(abQuality or 0)..'",'..
					'"curDurability": "'..tostring(abCurrentDurability or 0)..'",'..
					'"maxDurability": "'..tostring(abMaxDurability or 0)..'",'..
					'"cooldownStart": "'..tostring(abCooldownStart or 0)..'",'..
					'"cooldownEnd": "'..tostring(abCooldownEnd or 0)..'",'..
					'"name": "'..tostring(abName or 0)..'",'..
					'"lootable": "'..tostring(abLootable or 0)..'",'..
					'"readable": "'..tostring(abReadable or 0)..'",'..
					'"link": "'..tostring(abItemLink or 0)..'",'..
					'"level": "'..tostring(abLevel or 0)..'",'..
					'"minLevel": "'..tostring(abMinLevel or 0)..'",'..
					'"type": "'..tostring(abType or 0)..'",'..
					'"subtype": "'..tostring(abSubType or 0)..'",'..
					'"maxStack": "'..tostring(abStackCount or 0)..'",'..
					'"equiplocation": "'..tostring(abEquipLoc or 0)..'",'..
					'"sellprice": "'..tostring(abSellPrice or 0)..'"'..
				'}';
			if b < 4 or s < containerSlots then
				abotInventoryResult=abotInventoryResult..',';
			end
		end
	end
end
abotInventoryResult=abotInventoryResult..']';