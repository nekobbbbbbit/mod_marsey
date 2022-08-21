local S = mobs.intllib_monster

local sounds = {"bussy", "cringe", "yikes"}

mobs:register_mob(
   "marsey:marsey",
   {
      type = "animal",
      passive = false,
      visual = "mesh",
      mesh = "Marsey3d.obj",
      textures = {
         { "marseybaked.png" },
      },
      makes_footstep_sound = true,
      randomly_turn = true,
      attack_chance = 3,
      attack_type = "dogfight",
      attack_players = true,
      hp_min = 20,
      hp_max = 40,
      sounds = {
         distance = 10,
         random = "bussy",
         damage = "yikes",
         death = "cringe",
      },
      visual_size = {x = 4, y = 4, z = 4},
      walk_velocity = 3,
      run_velocity = 3,
      drops = {
         {name = "advtrains:dtrack_placer", chance = 1, min = 2, max = 15}
      },
      follow = { "advtrains:dtrack_placer" },
      owner_loyal = true,
      jump = true,
      follow = { "player" },
      on_rightclick = function (self, clicker)
         minetest.chat_send_player(clicker:get_player_name(), "Dude bussy lmao")
         minetest.sound_play(
            {
               name = sounds[math.random(1,3)],
            },
            {
               pos = clicker:get_pos(),
               gain = 1.0
            }, true)
      end,
      view_range = 15,
      fall_damage = 0,
   }
)

if not mobs.custom_spawn_monster then
   mobs:spawn({
         name = "marsey:marsey",
         nodes = {"group:dirt", "group:stone", "default:dirt_with_grass"},
         interval = 4,
         active_object_count = 100,
         chance = 3000,
         on_map_load = true,
         day_toggle = nil,
   })
end

mobs:register_egg("marsey:marsey", S("Marsey"), "nothing.png", 1)

mobs:alias_mob("animals:marsey", "marsey:marsey") -- Compat
