-- will capture events and spit them out into a json

abEventJson='['
for a,b in pairs(abEventTable)do 
    abEventJson=abEventJson..'{'
    for c,d in pairs(b)do 
        if type(d)=="table"then 
            abEventJson=abEventJson..'\"args\": ['
            for e,f in pairs(d)do 
                abEventJson=abEventJson..'\"'..f..'\"'
                if e<=table.getn(d)then 
                    abEventJson=abEventJson..','
                end 
            end;
            abEventJson=abEventJson..']}'
            if a<table.getn(abEventTable)then 
                abEventJson=abEventJson..','
            end 
        else 
            if type(d)=="string"then 
                abEventJson=abEventJson..'\"event\": \"'..d..'\",'
            else 
                abEventJson=abEventJson..'\"time\": \"'..d..'\",'
            end 
        end 
    end 
end;
abEventJson=abEventJson..']';
abEventTable={};