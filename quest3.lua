-- Function to attack the target
function attack(target)
    if target then
        Send({Target = target, Action = "Attack"})
    end
end

-- Function to get the nearest enemy
function get_nearest_enemy()
    -- Implement logic to find the nearest enemy
    local enemies = {"Enemy1", "Enemy2", "Enemy3"}
    return enemies[math.random(#enemies)]
end

-- Function to move the bot in a given direction
function move(direction)
    Send({Target = "Arena", Action = "Move", Direction = direction})
end

-- Function to get a random direction
function get_random_direction()
    local directions = {"North", "South", "East", "West"}
    return directions[math.random(#directions)]
end

-- Function to get the bot's health
function get_health()
    -- Placeholder logic for getting health
    return math.random(100)
end

-- Custom wait function
function wait(seconds)
    local start = os.time()
    repeat until os.time() > start + seconds
end

-- Main bot logic
function main()
    while true do
        local health = get_health()
        
        if health < 20 then
            -- If health is low, move away from enemies
            local direction = get_random_direction()
            move(direction)
            wait(1)
        else
            local target = get_nearest_enemy()
            attack(target)
            
            local direction = get_random_direction()
            move(direction)
            
            -- Additional bot behavior logic
            if math.random() > 0.5 then
                -- Occasionally pause before the next move
                wait(2)
            else
                -- Occasionally move twice in a row
                local second_direction = get_random_direction()
                move(second_direction)
            end
            
            wait(1)
        end
    end
end

main()
