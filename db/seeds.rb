# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Dungeon.destroy_all
Monster.destroy_all
        @dungeon_1 = Dungeon.create!(
          name: "Blackreach", 
          kind: "Dwemer Ruins", 
          hold: "Winterhold", 
          cleared: false, 
          visit_count: 29
        )
        @dun_1_mon_1 = @dungeon_1.monsters.create!(
          name: "Falmer",
          dead: false,
          health: 180,
          level: 9,
          soul_size: "Common",
          loot: "Falmer War Axe"
        )
        @dun_1_mon_2 = @dungeon_1.monsters.create!(
          name: "Chaurus",
          dead: false,
          health: 253,
          level: 12,
          soul_size: "Lesser",
          loot: "Chaurus Chitin"
        )
        @dun_1_mon_3 = @dungeon_1.monsters.create!(
          name: "Dwarven Centurion",
          dead: true,
          health: 653,
          level: 24,
          soul_size: "Grand",
          loot: "Centurion Dynamo Core"
        )
        @dun_1_mon_4 = @dungeon_1.monsters.create!(
          name: "Frostbite Spider",
          dead: true,
          health: 220,
          level: 8,
          soul_size: "Petty",
          loot: "Frostbite Venom"
        )
        @dungeon_2 = Dungeon.create!(
          name: "Forsaken Cave",
          kind: "Cave",
          hold: "The Pale",
          cleared: true,
          visit_count: 30
        )
        @dun_2_mon_1 = @dungeon_2.monsters.create!(
          name: "Ice Wraith",
          dead: true,
          health: 193,
          level: 9,
          soul_size: "Lesser",
          loot: "Ice Wraith Teeth"
        )
        @dun_2_mon_2 = @dungeon_2.monsters.create!(
          name: "Draugr",
          dead: true,
          health: 50,
          level: 1,
          soul_size: "Petty",
          loot: "Ancient Nord Bow"
        )
        @dun_2_mon_3 = @dungeon_2.monsters.create!(
          name: "Curalmil",
          dead: true,
          health: 404,
          level: 15,
          soul_size: "Greater",
          loot: "Elven Shield of Greater Blocking"
        )
        @dungeon_3 = Dungeon.create!(
          name: "Bleak Falls Barrow",
          kind: "Nordic Tomb",
          hold: "Falkreath Hold",
          cleared: false,
          visit_count: 3
        )
        @dun_3_mon_1 = @dungeon_3.monsters.create!(
          name: "Draugr Overlord",
          dead: false,
          health: 380,
          level: 15,
          soul_size: "Greater",
          loot: "Ancient Nord Great Sword of Burning"
        )
        @dun_3_mon_2 = @dungeon_3.monsters.create!(
          name: "Bandit",
          dead: true,
          health: 79,
          level: 4,
          soul_size: "Black",
          loot: "Leather Boots"
        )
        @dungeon_4 = Dungeon.create!(
          name: "Mistwatch",
          kind: "Fort Ruin",
          hold: "Eastmarch",
          cleared: true,
          visit_count: 17
        )
        @dun_4_mon_1 = @dungeon_4.monsters.create!(
          name: "Bandit Highwayman",
          dead: true,
          health: 318,
          level: 14,
          soul_size: "Black",
          loot: "Hide Bracers"
        )


        # monster template
        # @dun_#_mon_# = @dungeon_#.monsters.create!(
        #   name: "",
        #   dead: ,
        #   health: ,
        #   level: ,
        #   soul_size: "",
        #   loot: ""
        # )