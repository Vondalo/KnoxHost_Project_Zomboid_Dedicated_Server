SandboxVars = {
    VERSION = 5,
    -- Changing this sets the "Population Multiplier" advanced option. Default=Normal
    -- 1 = Insane
    -- 2 = Very High
    -- 3 = High
    -- 4 = Normal
    -- 5 = Low
    Zombies = 4,
    -- Default=Urban Focused
    -- 1 = Urban Focused
    Distribution = 1,
    -- Default=1 Hour
    -- 1 = 15 Minutes
    -- 2 = 30 Minutes
    -- 3 = 1 Hour
    -- 4 = 2 Hours
    -- 5 = 3 Hours
    -- 6 = 4 Hours
    -- 7 = 5 Hours
    -- 8 = 6 Hours
    -- 9 = 7 Hours
    -- 10 = 8 Hours
    -- 11 = 9 Hours
    -- 12 = 10 Hours
    -- 13 = 11 Hours
    -- 14 = 12 Hours
    -- 15 = 13 Hours
    -- 16 = 14 Hours
    -- 17 = 15 Hours
    -- 18 = 16 Hours
    -- 19 = 17 Hours
    -- 20 = 18 Hours
    -- 21 = 19 Hours
    -- 22 = 20 Hours
    -- 23 = 21 Hours
    -- 24 = 22 Hours
    -- 25 = 23 Hours
    DayLength = 3,
    StartYear = 1,
    -- Default=July
    -- 1 = January
    -- 2 = February
    -- 3 = March
    -- 4 = April
    -- 5 = May
    -- 6 = June
    -- 7 = July
    -- 8 = August
    -- 9 = September
    -- 10 = October
    -- 11 = November
    StartMonth = 7,
    StartDay = 9,
    -- Default=9 AM
    -- 1 = 7 AM
    -- 2 = 9 AM
    -- 3 = 12 PM
    -- 4 = 2 PM
    -- 5 = 5 PM
    -- 6 = 9 PM
    -- 7 = 12 AM
    -- 8 = 2 AM
    StartTime = 1,
    -- Default=0-30 Days
    -- 1 = Instant
    -- 2 = 0-30 Days
    -- 3 = 0-2 Months
    -- 4 = 0-6 Months
    -- 5 = 0-1 Year
    -- 6 = 0-5 Years
    -- 7 = 2-6 Months
    WaterShut = 3,
    -- Default=0-30 Days
    -- 1 = Instant
    -- 2 = 0-30 Days
    -- 3 = 0-2 Months
    -- 4 = 0-6 Months
    -- 5 = 0-1 Year
    -- 6 = 0-5 Years
    -- 7 = 2-6 Months
    ElecShut = 3,
    -- Minimum=-1 Maximum=2147483647 Default=14
    WaterShutModifier = 14,
    -- Minimum=-1 Maximum=2147483647 Default=14
    ElecShutModifier = 14,
    -- Default=Rare (loot x 0.6)
    -- 1 = None (loot x 0)
    -- 2 = Insanely Rare (loot x 0.05)
    -- 3 = Extremely Rare (loot x 0.2)
    -- 4 = Rare (loot x 0.6)
    -- 5 = Normal (loot x 1.0)
    -- 6 = Common (loot x 2.0)
    FoodLoot = 3,
    -- Default=Rare (loot x 0.6)
    -- 1 = None (loot x 0)
    -- 2 = Insanely Rare (loot x 0.05)
    -- 3 = Extremely Rare (loot x 0.2)
    -- 4 = Rare (loot x 0.6)
    -- 5 = Normal (loot x 1.0)
    -- 6 = Common (loot x 2.0)
    CannedFoodLoot = 3,
    -- Default=Rare (loot x 0.6)
    -- 1 = None (loot x 0)
    -- 2 = Insanely Rare (loot x 0.05)
    -- 3 = Extremely Rare (loot x 0.2)
    -- 4 = Rare (loot x 0.6)
    -- 5 = Normal (loot x 1.0)
    -- 6 = Common (loot x 2.0)
    LiteratureLoot = 2,
    -- Seeds, Nails, Saws, Fishing Rods, various tools, etc... Default=Rare (loot x 0.6)
    -- 1 = None (loot x 0)
    -- 2 = Insanely Rare (loot x 0.05)
    -- 3 = Extremely Rare (loot x 0.2)
    -- 4 = Rare (loot x 0.6)
    -- 5 = Normal (loot x 1.0)
    -- 6 = Common (loot x 2.0)
    SurvivalGearsLoot = 3,
    -- Default=Rare (loot x 0.6)
    -- 1 = None (loot x 0)
    -- 2 = Insanely Rare (loot x 0.05)
    -- 3 = Extremely Rare (loot x 0.2)
    -- 4 = Rare (loot x 0.6)
    -- 5 = Normal (loot x 1.0)
    -- 6 = Common (loot x 2.0)
    MedicalLoot = 2,
    -- Default=Rare (loot x 0.6)
    -- 1 = None (loot x 0)
    -- 2 = Insanely Rare (loot x 0.05)
    -- 3 = Extremely Rare (loot x 0.2)
    -- 4 = Rare (loot x 0.6)
    -- 5 = Normal (loot x 1.0)
    -- 6 = Common (loot x 2.0)
    WeaponLoot = 3,
    -- Default=Rare (loot x 0.6)
    -- 1 = None (loot x 0)
    -- 2 = Insanely Rare (loot x 0.05)
    -- 3 = Extremely Rare (loot x 0.2)
    -- 4 = Rare (loot x 0.6)
    -- 5 = Normal (loot x 1.0)
    -- 6 = Common (loot x 2.0)
    RangedWeaponLoot = 2,
    -- Default=Rare (loot x 0.6)
    -- 1 = None (loot x 0)
    -- 2 = Insanely Rare (loot x 0.05)
    -- 3 = Extremely Rare (loot x 0.2)
    -- 4 = Rare (loot x 0.6)
    -- 5 = Normal (loot x 1.0)
    -- 6 = Common (loot x 2.0)
    AmmoLoot = 3,
    -- Default=Rare (loot x 0.6)
    -- 1 = None (loot x 0)
    -- 2 = Insanely Rare (loot x 0.05)
    -- 3 = Extremely Rare (loot x 0.2)
    -- 4 = Rare (loot x 0.6)
    -- 5 = Normal (loot x 1.0)
    -- 6 = Common (loot x 2.0)
    MechanicsLoot = 3,
    -- Everything else. Also affects foraging for all items in Town/Road zones. Default=Rare (loot x 0.6)
    -- 1 = None (loot x 0)
    -- 2 = Insanely Rare (loot x 0.05)
    -- 3 = Extremely Rare (loot x 0.2)
    -- 4 = Rare (loot x 0.6)
    -- 5 = Normal (loot x 1.0)
    -- 6 = Common (loot x 2.0)
    OtherLoot = 3,
    -- Controls the global temperature. Default=Normal
    -- 1 = Very Cold
    -- 2 = Cold
    -- 3 = Normal
    -- 4 = Hot
    Temperature = 3,
    -- Controls how often it rains. Default=Normal
    -- 1 = Very Dry
    -- 2 = Dry
    -- 3 = Normal
    -- 4 = Rainy
    Rain = 3,
    -- Number of days until 100% growth. Default=Normal (100 Days)
    -- 1 = Very Fast (20 Days)
    -- 2 = Fast (50 Days)
    -- 3 = Normal (100 Days)
    -- 4 = Slow (200 Days)
    ErosionSpeed = 4,
    -- Number of days until 100% growth. -1 means no growth. Zero means use the Erosion Speed option. Maximum 36,500 (100 years). Minimum=-1 Maximum=36500 Default=0
    ErosionDays = 0,
    -- Modifies the base XP gain from actions by this number. Minimum=0.00 Maximum=1000.00 Default=1.00
    XpMultiplier = 1.0,
    -- Determines if the XP multiplier affects passively levelled skills eg. Fitness and Strength.
    XpMultiplierAffectsPassive = false,
    -- Use this to multiply or reduce engine general loudness. Minimum=0.00 Maximum=100.00 Default=1.00
    ZombieAttractionMultiplier = 1.0,
    -- Governs whether cars are locked, need keys to start etc.
    VehicleEasyUse = false,
    -- Controls the speed of plant growth. Default=Normal
    -- 1 = Very Fast
    -- 2 = Fast
    -- 3 = Normal
    -- 4 = Slow
    Farming = 3,
    -- Controls the time it takes for food to break down in a composter. Default=2 Weeks
    -- 1 = 1 Week
    -- 2 = 2 Weeks
    -- 3 = 3 Weeks
    -- 4 = 4 Weeks
    -- 5 = 6 Weeks
    -- 6 = 8 Weeks
    -- 7 = 10 Weeks
    CompostTime = 2,
    -- How fast character's hunger, thirst and fatigue will decrease. Default=Normal
    -- 1 = Very Fast
    -- 2 = Fast
    -- 3 = Normal
    -- 4 = Slow
    StatsDecrease = 3,
    -- Controls the abundance of fish and general forage. Default=Normal
    -- 1 = Very Poor
    -- 2 = Poor
    -- 3 = Normal
    -- 4 = Abundant
    NatureAbundance = 2,
    -- Default=Sometimes
    -- 1 = Never
    -- 2 = Extremely Rare
    -- 3 = Rare
    -- 4 = Sometimes
    -- 5 = Often
    Alarm = 4,
    -- How frequently homes and buildings will be discovered locked Default=Very Often
    -- 1 = Never
    -- 2 = Extremely Rare
    -- 3 = Rare
    -- 4 = Sometimes
    -- 5 = Often
    LockedHouses = 6,
    -- Spawn with chips, water bottle, school bag, baseball bat and a hammer.
    StarterKit = false,
    -- Nutritional value of food affects the player's condition.
    Nutrition = true,
    -- Define how fast the food will spoil inside or outside fridge. Default=Normal
    -- 1 = Very Fast
    -- 2 = Fast
    -- 3 = Normal
    -- 4 = Slow
    FoodRotSpeed = 3,
    -- Define how much a fridge will be effective. Default=Normal
    -- 1 = Very Low
    -- 2 = Low
    -- 3 = Normal
    -- 4 = High
    FridgeFactor = 3,
    -- Items will respawn in already-looted containers in towns and trailer parks. Items will not respawn in player-made containers. Default=None
    -- 1 = None
    -- 2 = Every Day
    -- 3 = Every Week
    -- 4 = Every Month
    LootRespawn = 1,
    -- When > 0, loot will not respawn in zones that have been visited within this number of in-game hours. Minimum=0 Maximum=2147483647 Default=0
    SeenHoursPreventLootRespawn = 0,
    -- A comma-separated list of item types that will be removed after HoursForWorldItemRemoval hours.
    WorldItemRemovalList = "Base.Hat,Base.Glasses,Base.Maggots,Base.RippedSheets,Base.RippedSheetsDirty,Base.Battery,Base.WaterBottleEmpty,Base.PopBottleEmpty,Base.UnusableWood,Base.UnusableMetal,Base.LightBulb,Base.Twigs,Base.BandageDirty,Base.LeatherStripsDirty,Base.DenimStripsDirty,Base.BeerCanEmpty,Base.PopEmpty,Base.Pop2Empty,Base.Pop3Empty,Base.TinCanEmpty,,EHE.EvacuationFlyer,EHE.EmergencyFlyer,EHE.QuarantineFlyer,EHE.PreventionFlyer,EHE.NoticeFlyer",
    -- Number of hours since an item was dropped on the ground before it is removed.  Items are removed the next time that part of the map is loaded.  Zero means items are not removed. Minimum=0.00 Maximum=2147483647.00 Default=24.00
    HoursForWorldItemRemoval = 24.0,
    -- If true, any items *not* in WorldItemRemovalList will be removed.
    ItemRemovalListBlacklistToggle = false,
    -- This will affect starting world erosion and food spoilage. Default=0
    -- 1 = 0
    -- 2 = 1
    -- 3 = 2
    -- 4 = 3
    -- 5 = 4
    -- 6 = 5
    -- 7 = 6
    -- 8 = 7
    -- 9 = 8
    -- 10 = 9
    -- 11 = 10
    -- 12 = 11
    TimeSinceApo = 1,
    -- Will influence how much water the plant will lose per day and their ability to avoid disease. Default=Normal
    -- 1 = Very High
    -- 2 = High
    -- 3 = Normal
    -- 4 = Low
    PlantResilience = 3,
    -- Controls the yield of plants when harvested. Default=Normal
    -- 1 = Very Poor
    -- 2 = Poor
    -- 3 = Normal
    -- 4 = Abundant
    PlantAbundance = 2,
    -- Recovery from being tired from performing actions Default=Normal
    -- 1 = Very Fast
    -- 2 = Fast
    -- 3 = Normal
    -- 4 = Slow
    EndRegen = 3,
    -- How regularly helicopters pass over the event zone. Default=Once
    -- 1 = Never
    -- 2 = Once
    -- 3 = Sometimes
    Helicopter = 1,
    -- How often zombie attracting metagame events like distant gunshots will occur. Default=Sometimes
    -- 1 = Never
    -- 2 = Sometimes
    MetaEvent = 2,
    -- Governs night-time metagame events during the player's sleep. Default=Never
    -- 1 = Never
    -- 2 = Sometimes
    SleepingEvent = 1,
    -- Increase/decrease the chance of electrical generators spawning on the map. Default=Sometimes
    -- 1 = Extremely Rare
    -- 2 = Rare
    -- 3 = Sometimes
    -- 4 = Often
    GeneratorSpawning = 2,
    -- How much fuel is consumed per in-game hour. Minimum=0.00 Maximum=100.00 Default=1.00
    GeneratorFuelConsumption = 0.8,
    -- Increase/decrease probability of discovering randomized safe houses on the map: either burnt out, containing loot stashes, dead survivor bodies etc. Default=Rare
    -- 1 = Never
    -- 2 = Extremely Rare
    -- 3 = Rare
    -- 4 = Sometimes
    -- 5 = Often
    SurvivorHouseChance = 1,
    -- Default=Rare
    -- 1 = Never
    -- 2 = Extremely Rare
    -- 3 = Rare
    -- 4 = Sometimes
    -- 5 = Often
    VehicleStoryChance = 3,
    -- Default=Rare
    -- 1 = Never
    -- 2 = Extremely Rare
    -- 3 = Rare
    -- 4 = Sometimes
    -- 5 = Often
    ZoneStoryChance = 3,
    -- Impacts on how often a looted map will have annotations marked on it by a deceased survivor. Default=Sometimes
    -- 1 = Never
    -- 2 = Extremely Rare
    -- 3 = Rare
    -- 4 = Sometimes
    -- 5 = Often
    AnnotatedMapChance = 2,
    -- Adds free points during character creation. Minimum=-100 Maximum=100 Default=0
    CharacterFreePoints = 0,
    -- Gives player-built constructions extra hit points so they are more resistant to zombie damage. Default=Normal
    -- 1 = Very Low
    -- 2 = Low
    -- 3 = Normal
    -- 4 = High
    ConstructionBonusPoints = 3,
    -- Governs the ambient lighting at night. Default=Normal
    -- 1 = Pitch Black
    -- 2 = Dark
    -- 3 = Normal
    NightDarkness = 3,
    -- Governs the time from dusk to dawn. Default=Normal
    -- 1 = Always Night
    -- 2 = Long
    -- 3 = Normal
    -- 4 = Short
    NightLength = 3,
    -- Increase and decrease the impact injuries have on your body, and their healing time. Default=Normal
    -- 1 = Low
    -- 2 = Normal
    InjurySeverity = 2,
    -- Enable or disable broken limbs when survivors receive injuries from impacts, zombie damage and falls.
    BoneFracture = true,
    -- How long before zombie bodies disappear. Minimum=-1.00 Maximum=2147483647.00 Default=216.00
    HoursForCorpseRemoval = 216.0,
    -- Governs impact that nearby decaying bodies has on the player's health and emotions. Default=Normal
    -- 1 = None
    -- 2 = Low
    -- 3 = Normal
    DecayingCorpseHealthImpact = 3,
    -- How much blood is sprayed on floor and walls. Default=Normal
    -- 1 = None
    -- 2 = Low
    -- 3 = Normal
    -- 4 = High
    BloodLevel = 2,
    -- Governs how quickly clothing degrades, becomes dirty, and bloodied. Default=Normal
    -- 1 = Disabled
    -- 2 = Slow
    -- 3 = Normal
    ClothingDegradation = 3,
    FireSpread = true,
    -- Number of in-game days before rotten food is removed from the map. -1 means rotten food is never removed. Minimum=-1 Maximum=2147483647 Default=-1
    DaysForRottenFoodRemoval = -1,
    -- If enabled, generators will work on exterior tiles, allowing for example to power gas pump.
    AllowExteriorGenerator = true,
    -- Controls the maximum intensity of fog. Default=Normal
    -- 1 = Normal
    -- 2 = Moderate
    MaxFogIntensity = 1,
    -- Controls the maximum intensity of rain. Default=Normal
    -- 1 = Normal
    -- 2 = Moderate
    MaxRainFxIntensity = 1,
    -- If disabled snow will not accumulate on ground but will still be visible on vegetation and rooftops.
    EnableSnowOnGround = true,
    -- When enabled certain melee weapons will be able to strike multiple zombies in one hit.
    MultiHitZombies = true,
    -- Chance of being bitten when a zombie attacks from behind. Default=High
    -- 1 = Low
    -- 2 = Medium
    RearVulnerability = 3,
    -- Disable to walk unimpeded while melee attacking.
    AttackBlockMovements = true,
    AllClothesUnlocked = false,
    -- if disabled, tainted water will not have a warning marking it as such
    EnableTaintedWaterText = true,
    -- Governs how frequently cars are discovered on the map Default=Low
    -- 1 = None
    -- 2 = Very Low
    -- 3 = Low
    -- 4 = Normal
    CarSpawnRate = 3,
    -- Governs the chances of finding vehicles with gas in the tank. Default=Low
    -- 1 = Low
    -- 2 = Normal
    ChanceHasGas = 1,
    -- Governs how full gas tanks will be in discovered cars. Default=Low
    -- 1 = Very Low
    -- 2 = Low
    -- 3 = Normal
    -- 4 = High
    -- 5 = Very High
    InitialGas = 2,
    -- Governs how full gas tanks in fuel station will be, initially. Default=Normal
    -- 1 = Empty
    -- 2 = Super Low
    -- 3 = Very Low
    -- 4 = Low
    -- 5 = Normal
    -- 6 = High
    -- 7 = Very High
    -- 8 = Full
    FuelStationGas = 4,
    -- How gas-hungry vehicles on the map are. Minimum=0.00 Maximum=100.00 Default=1.00
    CarGasConsumption = 1.0,
    -- Default=Rare
    -- 1 = Never
    -- 2 = Extremely Rare
    -- 3 = Rare
    -- 4 = Sometimes
    -- 5 = Often
    LockedCar = 4,
    -- General condition of vehicles discovered on the map Default=Low
    -- 1 = Very Low
    -- 2 = Low
    -- 3 = Normal
    -- 4 = High
    CarGeneralCondition = 1,
    -- Governs the amount of damage dealt to vehicles that crash. Default=Normal
    -- 1 = Very Low
    -- 2 = Low
    -- 3 = Normal
    -- 4 = High
    CarDamageOnImpact = 3,
    -- Damage received by the player from the car in a collision. Default=None
    -- 1 = None
    -- 2 = Low
    -- 3 = Normal
    -- 4 = High
    DamageToPlayerFromHitByACar = 3,
    -- Enable or disable traffic jams that spawn on the main roads of the map.
    TrafficJam = true,
    -- How frequently cars will be discovered with an alarm. Default=Extremely Rare
    -- 1 = Never
    -- 2 = Extremely Rare
    -- 3 = Rare
    -- 4 = Sometimes
    -- 5 = Often
    CarAlarm = 2,
    -- Enable or disable player getting damage from being in a car accident.
    PlayerDamageFromCrash = true,
    -- How many in-game hours before a wailing siren shuts off. Minimum=0.00 Maximum=168.00 Default=0.00
    SirenShutoffHours = 0.0,
    --  Governs whether player can discover a car that has been maintained and cared for after the infection struck. Default=Low
    -- 1 = None
    -- 2 = Low
    -- 3 = Normal
    RecentlySurvivorVehicles = 1,
    -- Enables vehicles to spawn.
    EnableVehicles = true,
    -- Governs if poisoning food is enabled. Default=True
    -- 1 = True
    -- 2 = False
    EnablePoisoning = 1,
    -- Default=In and around bodies
    -- 1 = In and around bodies
    -- 2 = In bodies only
    MaggotSpawn = 1,
    -- The higher the value, the longer lightbulbs last before breaking. If 0, lightbulbs will never break. Does not affect vehicle headlights. Minimum=0.00 Maximum=1000.00 Default=1.00
    LightBulbLifespan = 1.2,
    -- Vanilla Chance is 6% Minimum=0 Maximum=100 Default=6
    ChanceOfAttachedWeapon = 6,
    -- Katanas and machetes Minimum=0 Maximum=100 Default=1
    ChanceOfLongBlade = 1,
    -- Minimum=0 Maximum=100 Default=5
    ChanceOfHuntingKnife = 5,
    -- Minimum=0 Maximum=100 Default=5
    ChanceOfSpears = 5,
    -- Minimum=0 Maximum=100 Default=2
    ChanceOfAxe = 2,
    -- Crowbar, metal pipe, metal bar, nightstick Minimum=0 Maximum=100 Default=3
    ChanceOfBlunts = 3,
    -- Only on outfits that can have guns. (police, bandits...) Minimum=0 Maximum=100 Default=50
    ChanceOfGunsOnOutfits = 10,
    -- Example of standard days requirements:
    -- Katana - 60 days
    -- Spears - 30 days
    -- Machete - 20 days
    -- Axe - 15 days
    -- Good knives, crowbar, short blunts - 10 days Default=Normal
    -- 1 = None
    -- 2 = Quarter
    -- 3 = Half
    -- 4 = Normal
    DaySurvivedModifier = 4,
    -- Loot of all types found on generic zombies, zombie outfits, and bags.
    -- Note: zombie loot is not affected by the other multipliers below. Minimum=0.00 Maximum=10.00 Default=1.00
    ZombieLootMultiplier = 1.0,
    -- A semicolon separated list of items and chances to add to the zombie loot.
    ItemsAddedToZombieLoot = "Base.Money:0.05;Base.SheetPaper2:0.05",
    ItemsAddedToMilitaryZedsLoot = "",
    ItemsAddedToPoliceZedsLoot = "",
    ItemsAddedToFiremenZedsLoot = "",
    -- Tourists, Golfers, Weddings, Classy...
    ItemsAddedToRichZedsLoot = "",
    -- Park rangers, survivalists, hunters, farmers, fishermen, campers...
    ItemsAddedToRuralZedsLoot = "",
    -- Raiders, Bandits, Militia, Thugs, Escaped inmates, survivors...
    ItemsAddedToRogueZedsLoot = "",
    -- Students, Teachers...
    ItemsAddedToSchoolZedsLoot = "",
    -- Fitness Instructors, Baseball Fans, Baseball players, Boxing players, Jockeys...
    ItemsAddedToSportsZedsLoot = "",
    -- Doctors, Nurses, Pharmacists, Ambulance Drivers...
    ItemsAddedToMedicalZedsLoot = "",
    -- Mechanics, Metalworkers, McCoys, Foremen, Construction workers, Woodcutters...
    ItemsAddedToIndustryZedsLoot = "",
    -- Fossoil, Gas2Go, Thundergas...
    ItemsAddedToGasStationZedsLoot = "",
    -- Waiters, Cooks, Chefs...
    ItemsAddedToRestaurantZedsLoot = "",
    ItemsAddedToOfficeWorkersZedsLoot = "",
    -- A semicolon separated list of zombie outfits that will drop the Custom Zed Outfits Loot defined below.
    -- Example: 'Priest;Biker;Redneck;Swimmer;Bedroom;Bathrobe;Hobbo;Party;Party2'
    -- Example 2: 'Security;Postal;Cyclist;StripperNaked;Bowling;MallSecurity;Inmate'
    -- Example 3(modded outfits): 'Nomad;Prepper;Stalker;AuthenticMaid;AuthenticNewsAnchor' 
    CustomOutfitList = "",
    -- Defined like the other loots.
    ItemsAddedToCustomOutfitListLoot = "",
    -- Minimum=1 Maximum=100 Default=20
    CigarettesCount = 1,
    -- If the number of rolls on a loot table is higher than this value, it will be set to this value.
    -- Most loot tables have a rolls value of 4.
    --  1 = ~ 75% less items per container,
    --  2 = ~ 50% less items per container,
    --  3 = ~ 25% less items per container,
    --  4 = almost nothing changes,
    --  5 = vanilla value Default=5 (100% items, vanilla)
    -- 1 = 1 (~25% items)
    -- 2 = 2 (~50% items)
    -- 3 = 3 (~75% items)
    -- 4 = 4 (~ 99% items)
    MaxRolls = 4,
    -- Same as the option above, but only affects food containers. Default=4 (100% food)
    -- 1 = 1 (~25% food)
    -- 2 = 2 (~50% food)
    -- 3 = 3 (~75% food)
    FoodTablesMaxRolls = 3,
    -- Default=4 (100% items)
    -- 1 = 1 (~25% items)
    -- 2 = 2 (~50% items)
    -- 3 = 3 (~75% items)
    MeleeWeaponsAndToolsTablesMaxRolls = 3,
    -- Default=4 (100% items)
    -- 1 = 1 (~25% items)
    -- 2 = 2 (~50% items)
    -- 3 = 3 (~75% items)
    GunsAndAmmoTablesMaxRolls = 3,
    -- Default=4 (100% items)
    -- 1 = 1 (~25% items)
    -- 2 = 2 (~50% items)
    -- 3 = 3 (~75% items)
    LitteratureTablesMaxRolls = 3,
    -- Default=4 (100% items)
    -- 1 = 1 (~25% items)
    -- 2 = 2 (~50% items)
    -- 3 = 3 (~75% items)
    MediaTablesMaxRolls = 3,
    -- Default=4 (100% items)
    -- 1 = 1 (~25% items)
    -- 2 = 2 (~50% items)
    -- 3 = 3 (~75% items)
    MechanicsTablesMaxRolls = 3,
    -- Default=4 (100% items)
    -- 1 = 1 (~25% items)
    -- 2 = 2 (~50% items)
    -- 3 = 3 (~75% items)
    OtherTablesMaxRolls = 3,
    -- Fresh and non-perishable food. Minimum=0.00 Maximum=10.00 Default=1.00
    FoodLootMultiplier = 0.7,
    -- Nonranged weapons of all kinds, except pens, forks and spoons.
    -- Includes Sledgehammer. Also includes instruments and some cooking tools. Minimum=0.00 Maximum=10.00 Default=1.00
    WeaponLootMultiplier = 0.7,
    -- Ranged weapons. Includes weapon parts for guns. Minimum=0.00 Maximum=10.00 Default=1.00
    GunLootMultiplier = 0.7,
    -- Ammunition and magazines Minimum=0.00 Maximum=10.00 Default=1.00
    AmmoLootMultiplier = 1.0,
    -- Saws, blowtorches, seeds, farming gear, fishing gear, camping gear, needles,
    -- crafting materials, repair materials, construction materials, gas cans, jars, maps. Minimum=0.00 Maximum=10.00 Default=1.00
    SurvivalGearLootMultiplier = 1.0,
    -- Tools to work on vehicles, and vehicle parts. Minimum=0.00 Maximum=10.00 Default=1.00
    MechanicsLootMultiplier = 0.8,
    -- Medicine, bandages, splint, needles, first aid kits... Minimum=0.00 Maximum=10.00 Default=1.00
    MedicalLootMultiplier = 1.0,
    -- Books and magazines Minimum=0.00 Maximum=10.00 Default=1.00
    LiteratureLootMultiplier = 0.2,
    -- VHS tapes, CDs and videogames Minimum=0.00 Maximum=10.00 Default=1.00
    MediaLootMultiplier = 0.7,
    -- Cleaning supplies, cooking tools, writing supplies, cutlery, extinguishers, can openers, razors, alarm clocks Minimum=0.00 Maximum=10.00 Default=1.00
    HouseholdSuppliesLootMultiplier = 1.0,
    -- All kinds of clothes, including gas masks and jewelry. Minimum=0.00 Maximum=10.00 Default=1.00
    ClothingLootMultiplier = 0.6,
    -- Including Garbage Bags Minimum=0.00 Maximum=10.00 Default=1.00
    ContainerLootMultiplier = 0.6,
    -- Includes lighters, matches, painting supplies, charcoal, propane tanks, antique ovens, junk items, and many more... Minimum=0.00 Maximum=10.00 Default=1.00
    OtherLootMultiplier = 0.8,
    -- A semicolon-separated list of items IDs that will NOT be affected by the multipliers above.
    -- Example: Base.Sledgehammer;Base.Saw
    -- Still affected by the multipliers list option below.
    ExceptionsList = "Base.Sledgehammer;Base.Sledgehammer2",
    -- A semicolon-separated list of specific multipliers for specific items.Example: Base.Sledgehammer=5;Base.Sledgehammer2=5;Base.Saw=0.5;Base.GardenSaw=0.5;Base.Hammer=0.1;Base.NailsBox=2
    -- These individual multipliers are applied on top of all other multipliers, and even if the item is in the exceptions list
    SpecificItemsList = "Base.Cigarettes:1;Base.Sledgehammer:1;Base.Sledgehammer2:1",
    AT_VehicleDamageenable = true,
    ATY_safezone_protect = true,
    ATY_nonpvp_protect = true,
    ATY_damagedisplay = false,
    -- Minimum=0 Maximum=100 Default=100
    AT_Blood = 100,
    -- Ranges from 0-100 in game. Sets how much boredom is removed every 10 minutes. Minimum=-100.00 Maximum=100.00 Default=3.50
    TrueMusicMoodImprovement_boredomMod = 3.5,
    -- Ranges 0-100 in game. THIS IS MY FCKIN JAM Minimum=-100.00 Maximum=100.00 Default=2.00
    TrueMusicMoodImprovement_happinessMod = 2.0,
    -- Ranges 0-1 in game. CAN'T BE STRESSED WHEN IM JAMMING Minimum=-1.00 Maximum=1.00 Default=0.01
    TrueMusicMoodImprovement_stressMod = 0.01,
    -- Enables Panic, Fatigue, and Pain Reduction.
    TrueMusicMoodImprovement_extraMods = false,
    -- Ranges 0-100 in game. LET ME FUCK UP THIS HORDE WHILE JAMMING. Minimum=-100.00 Maximum=100.00 Default=5.00
    TrueMusicMoodImprovement_panicMod = 5.0,
    -- Ranges 0-1 in game. Normal fatigue increases by about .006-.007 every 10 minutes. Minimum=-1.00 Maximum=1.00 Default=0.00
    TrueMusicMoodImprovement_fatigueMod = 0.0025,
    -- Ranges 0-100 in game. Can ONLY be subtracted ~ sorry no painful music. Minimum=0.00 Maximum=100.00 Default=5.00
    TrueMusicMoodImprovement_painMod = 5.0,
    Map = {
        AllowMiniMap = true,
        AllowWorldMap = true,
        MapAllKnown = true,
    },
    ZombieLore = {
        -- Controls the zombie movement rate. Default=Fast Shamblers
        -- 1 = Sprinters
        -- 2 = Fast Shamblers
        -- 3 = Shamblers
        Speed = 2,
        -- Controls the damage zombies inflict per attack. Default=Normal
        -- 1 = Superhuman
        -- 2 = Normal
        -- 3 = Weak
        Strength = 2,
        -- Controls the difficulty to kill zombies. Default=Normal
        -- 1 = Tough
        -- 2 = Normal
        -- 3 = Fragile
        Toughness = 2,
        -- Controls how the zombie virus spreads. Default=Blood + Saliva
        -- 1 = Blood + Saliva
        -- 2 = Saliva Only
        -- 3 = Everyone's Infected
        Transmission = 1,
        -- Controls how quickly the infection takes effect. Default=2-3 Days
        -- 1 = Instant
        -- 2 = 0-30 Seconds
        -- 3 = 0-1 Minutes
        -- 4 = 0-12 Hours
        -- 5 = 2-3 Days
        -- 6 = 1-2 Weeks
        Mortality = 5,
        -- Controls how quickly corpses rise as zombies. Default=0-1 Minutes
        -- 1 = Instant
        -- 2 = 0-30 Seconds
        -- 3 = 0-1 Minutes
        -- 4 = 0-12 Hours
        -- 5 = 2-3 Days
        Reanimate = 3,
        -- Controls zombie intelligence. Default=Basic Navigation
        -- 1 = Navigate + Use Doors
        -- 2 = Navigate
        -- 3 = Basic Navigation
        Cognition = 3,
        -- Controls which zombies can crawl under vehicles. Default=Often
        -- 1 = Crawlers Only
        -- 2 = Extremely Rare
        -- 3 = Rare
        -- 4 = Sometimes
        -- 5 = Often
        -- 6 = Very Often
        CrawlUnderVehicle = 5,
        -- Controls how long zombies remember players after seeing or hearing. Default=Normal
        -- 1 = Long
        -- 2 = Normal
        -- 3 = Short
        -- 4 = None
        Memory = 3,
        -- Controls zombie vision radius. Default=Normal
        -- 1 = Eagle
        -- 2 = Normal
        -- 3 = Poor
        Sight = 2,
        -- Controls zombie hearing radius. Default=Normal
        -- 1 = Pinpoint
        -- 2 = Normal
        -- 3 = Poor
        Hearing = 2,
        -- Zombies that have not seen/heard player can attack doors and constructions while roaming.
        ThumpNoChasing = false,
        -- Governs whether or not zombies can destroy player constructions and defences.
        ThumpOnConstruction = true,
        -- Governs whether zombies are more active during the day, or whether they act more nocturnally.  Active zombies will use the speed set in the "Speed" setting. Inactive zombies will be slower, and tend not to give chase. Default=Both
        -- 1 = Both
        -- 2 = Night
        ActiveOnly = 1,
        -- Allows zombies to trigger house alarms when breaking through windows and doors.
        TriggerHouseAlarm = false,
        -- When enabled if multiple zombies are attacking they can drag you down to feed. Dependent on zombie strength.
        ZombiesDragDown = true,
        -- When enabled zombies will have a chance to lunge after climbing over a fence if you're too close.
        ZombiesFenceLunge = true,
        -- Default=Some zombies in the world will pretend to be dead
        -- 1 = Some zombies in the world will pretend to be dead
        -- 2 = Some zombies in the world, as well as some you 'kill', can pretend to be dead
        DisableFakeDead = 1,
    },
    ZombieConfig = {
        -- Set by the "Zombie Count" population option. 4.0 = Insane, Very High = 3.0, 2.0 = High, 1.0 = Normal, 0.35 = Low, 0.0 = None. Minimum=0.00 Maximum=4.00 Default=1.00
        PopulationMultiplier = 1.0,
        -- Adjusts the desired population at the start of the game. Minimum=0.00 Maximum=4.00 Default=1.00
        PopulationStartMultiplier = 1.0,
        -- Adjusts the desired population on the peak day. Minimum=0.00 Maximum=4.00 Default=1.50
        PopulationPeakMultiplier = 1.6,
        -- The day when the population reaches it's peak. Minimum=1 Maximum=365 Default=28
        PopulationPeakDay = 31,
        -- The number of hours that must pass before zombies may respawn in a cell. If zero, spawning is disabled. Minimum=0.00 Maximum=8760.00 Default=72.00
        RespawnHours = 72.0,
        -- The number of hours that a chunk must be unseen before zombies may respawn in it. Minimum=0.00 Maximum=8760.00 Default=16.00
        RespawnUnseenHours = 16.0,
        -- The fraction of a cell's desired population that may respawn every RespawnHours. Minimum=0.00 Maximum=1.00 Default=0.10
        RespawnMultiplier = 0.1,
        -- The number of hours that must pass before zombies migrate to empty parts of the same cell. If zero, migration is disabled. Minimum=0.00 Maximum=8760.00 Default=12.00
        RedistributeHours = 12.0,
        -- The distance a zombie will try to walk towards the last sound it heard. Minimum=10 Maximum=1000 Default=100
        FollowSoundDistance = 100,
        -- The size of groups real zombies form when idle. Zero means zombies don't form groups. Groups don't form inside buildings or forest zones. Minimum=0 Maximum=1000 Default=20
        RallyGroupSize = 0,
        -- The distance real zombies travel to form groups when idle. Minimum=5 Maximum=50 Default=20
        RallyTravelDistance = 20,
        -- The distance between zombie groups. Minimum=5 Maximum=25 Default=15
        RallyGroupSeparation = 15,
        -- How close members of a group stay to the group's leader. Minimum=1 Maximum=10 Default=3
        RallyGroupRadius = 3,
    },
    SaveOurStationCore = {
        -- Does the Knox Power-Grid need to fail before broadcast faults/interruptions start occuring?
        RequirePowerShutoff = true,
        -- Broadcast faults may occur at random and, if not repaired by a player, will eventually cause a permanent failure of the broadcast system. Once a fault is identified, the broadcast system will provide a diagnostic code and the location of the affected system. Further information can be obtained through NWS Diagnostics Manuals and Registers.
        EnableFaults = true,
        -- Broadcast interruptions may occur at random, and will cause systems like Weather Forecasts and the Air Traffic Radar to temporarily stop working. Interruptions will resolve themselves after some time.
        EnableInterruptions = true,
        -- The Reliability Profile determines the probability/chance of a Fault or Interruption occuring. Default=Normal  |  Rare Faults, Frequent Interruptions
        -- 1 = Well-Maintained  |  Rare Faults, Rare Interruptions
        -- 2 = Reliable  |  Rare Faults, Occasional Interruptions
        -- 3 = Normal  |  Rare Faults, Frequent Interruptions
        -- 4 = Unreliable  |  Occasional Faults, Frequent Interruptions
        ReliabilityProfile = 3,
        -- This multiplier affects how long Fault/Interruption cycles last, how much time there is to repair a Fault, and how long the 'grace period' between each cycle is. Default=24x  |  Normal (Recommended for Singleplayer)
        -- 1 = 12x  |  Very Short (Recommended for Large Servers)
        -- 2 = 18x  |  Short
        -- 3 = 24x  |  Normal (Recommended for Singleplayer)
        TimeDurationMultiplier = 2,
        -- Enabling this option will omit Fault Diagnostic Code from the fault diagnostic message. You will need to travel to the affected location first to find the cause of the fault and how to fix it.
        OmitDiagnosticCode = false,
        -- Enabling this option will omit the time until emergency shutdown/standby from the fault diagnostic message. You won't know when the system shuts down and enters emergency standby until it is too late.
        OmitShutdownTime = false,
        -- Warning - this setting is not for the faint of heart! | Enabling this option will omit the Fault Location from the fault diagnostic message. In case of a fault, you will need to travel to each station until you find which one is affected.
        OmitLocation = false,
        -- Checking this box will make Save Our Station output additional information to the PZ Game Log. You should keep this turned off unless you either know what you are doing, or you have been asked to turn it on to provide additional information for diagnosing an issue.
        EnableDebugging = false,
    },
    RVInterior = {
        -- Zombies this distance or closer to a player will prevent them from entering vehicle interiors (0 = disabled). Minimum=0 Maximum=100 Default=20
        SafeZombieDistance = 20,
        -- Zombies currently chasing the player will prevent them from entering vehicle interiors, no matter the distance.
        NotWhenChased = true,
    },
    RestoreUtilities = {
        -- The minimum level of the electrical skill you need to make repairs. <LINE> Regardless of this setting you will still need generator knowledge or a consumable Insulated Wires fuse to make repairs. Minimum=0 Maximum=11 Default=2
        MinSkillLvl = 2,
        -- Multiplies the length of all successful repairs by this number, this modifier is the LAST thing to apply to the number of days a repair attempt will provide, meaning it also influences the effectiveness of any fuses that do the same. <LINE> <LINE> Set to a number below 1 to make your repairs last less time, and set to a higher number to make your repairs more effective. (I.E. setting this option to 2 will make all of your repairs 2x effective) Minimum=0.10 Maximum=10.00 Default=1.00
        ScalingRepairModifier = 0.8,
        -- How much electronic scrap you need per repair, this cost will be reduced by 25%/50% when using a T1/T2 Spare Parts fuse, respectively. Minimum=10 Maximum=1000 Default=40
        ScrapNeeded = 40,
        -- The chance of a failed repair. <LINE> This chance is reduced by 8% per level of electrical skill higher than the minimum. The chance is also reduced by half when using a Tier 1 Marked Components fuse, and fail chance is always set to 0% when using a Tier 2 Marked Components fuse. Minimum=0 Maximum=150 Default=80
        FailChance = 80,
        -- The chance of sustaining an injury after performing a repair, regardless of if it was a success or a fail. <LINE> <LINE> Upon a repair attempt, the mod will randomly roll a number between 0 and 100, if the rolled number is lower than the Injury Chance number, the player will suffer an injury. <LINE> If the rolled number lands above 80 then the player will suffer a burn. <LINE> If the rolled number is above 50 then the player will suffer a deep wound. <LINE> Otherwise, the player will be lacerated. <LINE> <LINE> This sandbox option only changes the base Injury Chance number, each level above the minimum required electrical skill will reduce the Injury Chance number by 10. <LINE> Similarly, the Insulated Wires fuse T1 will half the Injury Chance number (from 80 to 40, for example), and the T2 will set it to 0%. <LINE> <LINE> Set to 0 to completely disable the chance of injury upon repair attempt. Minimum=0 Maximum=150 Default=110
        InjuryChance = 110,
        -- The amount of electrical XP earned on repair of a utility. This is the full amount, so a character with 0 starting skill in electrical will only recieve 25% of this value, and a character with 3+ starting skill in electrical will get 150% of this value. <LINE> <LINE> This value is multiplied by 1.1x/1.2x for the Tier 1/Tier 2 Notes fuse, respectively. <LINE> <LINE> A failed repair attempt will instead grant 10% of this value. Minimum=0 Maximum=3000 Default=250
        XPEarned = 250,
        -- Default=Normal (1x)
        -- 1 = None (0x)
        -- 2 = Very Rare (0.25x)
        -- 3 = Rare (0.5x)
        -- 4 = Normal (1x)
        -- 5 = High (1.5x)
        -- 6 = Very High (2x)
        -- 7 = ULTRA RARE (0.05x)
        ScrapSpawnRateChest = 3,
        -- Default=Normal (1x)
        -- 1 = None (0x)
        -- 2 = Very Rare (0.25x)
        -- 3 = Rare (0.5x)
        -- 4 = Normal (1x)
        -- 5 = High (1.5x)
        -- 6 = Very High (2x)
        -- 7 = ULTRA RARE (0.05x)
        T1SpawnRateChest = 4,
        -- Default=Normal (1x)
        -- 1 = None (0x)
        -- 2 = Very Rare (0.25x)
        -- 3 = Rare (0.5x)
        -- 4 = Normal (1x)
        -- 5 = High (1.5x)
        -- 6 = Very High (2x)
        -- 7 = ULTRA RARE (0.05x)
        T2SpawnRateChest = 3,
        -- Default=Normal (1x)
        -- 1 = None (0x)
        -- 2 = Very Rare (0.25x)
        -- 3 = Rare (0.5x)
        -- 4 = Normal (1x)
        -- 5 = High (1.5x)
        -- 6 = Very High (2x)
        -- 7 = ULTRA RARE (0.05x)
        ScrapSpawnRateZombie = 3,
        -- Default=Normal (1x)
        -- 1 = None (0x)
        -- 2 = Very Rare (0.25x)
        -- 3 = Rare (0.5x)
        -- 4 = Normal (1x)
        -- 5 = High (1.5x)
        -- 6 = Very High (2x)
        -- 7 = ULTRA RARE (0.05x)
        T1SpawnRateZombie = 3,
        -- Default=Normal (1x)
        -- 1 = None (0x)
        -- 2 = Very Rare (0.25x)
        -- 3 = Rare (0.5x)
        -- 4 = Normal (1x)
        -- 5 = High (1.5x)
        -- 6 = Very High (2x)
        -- 7 = ULTRA RARE (0.05x)
        T2SpawnRateZombie = 2,
    },
    Tikitown = {
        CollectionBaseball = false,
        -- Minimum=0.00 Maximum=30.00 Default=4.00
        CollectionBaseballCommon = 4.0,
        -- Minimum=0.00 Maximum=30.00 Default=1.00
        CollectionBaseballRare = 1.0,
        -- Minimum=0.00 Maximum=0.40 Default=0.08
        CollectionBaseballZombieCommon = 0.075,
        -- Minimum=0.00 Maximum=0.40 Default=0.03
        CollectionBaseballZombieRare = 0.025,
        -- Enable or Disable the spawn of the Tikitorch spear weapon
        Tikitorch = false,
        -- Adjust spawn rate of the Tikitorch weapon Minimum=0.00 Maximum=50.00 Default=20.00
        TikitorchSpawnRate = 20.0,
        -- Enable or Disable Tikitown's custom historically clad zombies
        HistoricalOutfits = true,
        -- Enable or Disable Tikitown's post office package system
        PostOfficeOverride = true,
    },
    WeaponModifiers = {
        -- Minimum=0 Maximum=1000 Default=1
        StartDay = 1,
        -- Minimum=1 Maximum=1000 Default=60
        PeakDay = 60,
        -- Minimum=0.00 Maximum=100.00 Default=30.00
        OriginalModifierChance = 30.0,
        -- Minimum=0.00 Maximum=100.00 Default=70.00
        MaxModifierChance = 70.0,
        -- lower = higher chance of better modifiers and lower chance of bad modifiers
        -- higher = lower chance of better modifiers and higher chance of bad modifiers
        -- 
        -- WARNING: 0 = ALL modifiers are LEGENDARY rarity
        --  Minimum=0.00 Maximum=10.00 Default=1.10
        StartRarityTweaker = 1.1,
        -- lower = higher chance of better modifiers and lower chance of bad modifiers
        -- higher = lower chance of better modifiers and higher chance of bad modifiers
        -- 
        -- WARNING: 0 = ALL modifiers are LEGENDARY rarity
        --  Minimum=0.00 Maximum=10.00 Default=0.90
        PeakRarityTweaker = 0.9,
        -- For weapons stuck / attached to zombies.
        -- 
        -- Higher = Bigger chance of applying a random modifier to weapons attached to zombies.
        -- Lower = lower chance of applying a random modifier to weapons ATTACHED to zombies.
        --  Minimum=0.00 Maximum=3.00 Default=0.50
        AttachedWeaponsChanceMultiplier = 0.5,
        -- For ALL ranged weapons.
        -- 
        -- Does nothing if you're using the Realistic list.
        -- 
        -- Higher = Bigger chance of applying a random modifier to all RANGED weapons.
        -- Lower = lower chance of applying a random modifier to all RANGED weapons. Minimum=0.00 Maximum=3.00 Default=0.50
        RangedWeaponsChanceMultiplier = 0.5,
        -- For CRAFTED Ranged Weapons only.
        -- 
        -- Does nothing if you're using the Realistic list.
        -- 
        -- Does nothing if you are playing VANILLA or aren't using mods that add ranged weapons.
        -- 
        -- LEAVE THIS AT ZERO IF YOU ARE USING BRITA
        -- or similar mods that add different forms to ranged weapons.
        -- (folding/unfolding stock for example...)
        -- 
        -- Higher = Bigger chance of applying a random modifier to CRAFTED RANGED weapons.
        -- Lower = lower chance of applying a random modifier to CRAFTED RANGED weapons.
        --  Minimum=0.00 Maximum=3.00 Default=0.00
        ChanceMultiplierForCraftedRangedWeapons = 0.0,
        -- For CRAFTED Melee Weapons only.
        -- 
        -- Set this to zero if you're using mods that add different forms to melee weapons.
        -- (switch between axe/spear mode for example...)
        -- 
        -- Higher = Bigger chance of applying a random modifier to CRAFTED MELEE weapons.
        -- Lower = lower chance of applying a random modifier to CRAFTED MELEE weapons.
        --  Minimum=0.00 Maximum=3.00 Default=0.75
        ChanceMultiplierForCraftedMeleeWeapons = 0.75,
        -- Modifiers won't be applied to irrelevant weapons.
        -- (pens, spoons, forks, fishing rods, cooking pans, as well as construction materials like planks, metal bars, metal pipes.)
        -- 
        IgnoreIrrelevantWeapons = true,
        -- Minimum=0.00 Maximum=10.00 Default=1.00
        TinkeringSkillXpMultiplier = 1.0,
        -- Don't enable this if you use the Realistic list.
        RangedWeaponsTinkerable = true,
        -- To acquire the trait, you'll need the sum of your maintenance and tinkering levels to be at least 8, and to have tinkered 15 modifiers of at least epic rarity.
        DynamicTinkerer = false,
        -- How many items / how much of a drainable item is consumed when tinkering. Default=2
        -- 1 = 1
        -- 2 = 2
        -- 3 = 3
        TinkerCost = 2,
    },
    MoreDecreasingLoot = {
        -- If not checked, all the settings below will be ignored and the Item Remover will never trigger.
        Enable = false,
        -- The day the chance to remove items will start increasing proportionally every day, from the starting chance setting to the peak chance setting. Minimum=0 Maximum=1000 Default=2
        StartDay = 2,
        -- The day the loot will stop decreasing and after which the peak chance to remove items is always applied.
        -- Must be higher than the start day option! Minimum=0 Maximum=1000 Default=30
        PeakDay = 30,
        -- Applied before and on start day.
        -- Must be lower than the peak chance option! Minimum=0 Maximum=100 Default=0
        OriginalChance = 0,
        -- Applied after and on peak day.
        -- Must be higher than the starting chance option! Minimum=0 Maximum=100 Default=75
        MaxChance = 75,
        -- The number that will be added to the chance to remove items, for food items.
        -- Can be negative.
        -- Will make the actual chance go above the peak chance even after peak day, or below the original chance even before start day. Minimum=-100 Maximum=100 Default=20
        FoodChanceModifier = 20,
        -- When enabled, the chance of removing item becomes an average of randoms instead of strict chance.
        -- This means the difference between the loot of different containers can be much higher, but with the average chance of removing items still staying the same.
        -- Example: 20% chance becomes a random chance between 0% and 40%, once per container. 50% becomes 0%-100%. 65% becomes 30%-100%. 95% becomes 90%-100%
        -- Not recommended if the time between start day and peak day is low.
        EnhancedVariance = true,
        -- Check this if you want vehicle loot to be affected by the Item Remover.
        -- Affects gloveboxes, seats, trunks, and any other vehicle part that can contain items.
        TriggerOnVehicleParts = true,
        -- Check this if you want zombie loot to be affected by the Item Remover.
        -- This won't affect attached/lodged weapons and worn clothes and accessories.
        -- WARNING: This should also affect dead bodies of players and NPCs !
        TriggerOnDeadBodies = false,
        -- When enabled, the Item Remover will trigger when the player comes close to containers, INSTEAD of when the map cells load.
        -- Pro: does not trigger all the containers of the map before you explore them.
        -- Con: Some containers will appear to have items (shelves with books on them) but when you get close will have their items removed and could actually become empty.
        TriggerOnProximity = false,
    },
    DefinitiveZombies = {
        -- Turn on debugging mode. Debugging text will be written into: C:/Users/<user>/Zomboid/console.txt
        DebugEnable = false,
        -- How often the zombies will update, tied to the user's frame rate. Lower values will increase the rate in which zombies update, requires a powerful machine. Minimum=100 Maximum=10000 Default=300
        UpdateInterval = 300,
        -- Spaces out how often the zombies will update. This will reduce the memory load to your machine. Lower values will increase the frequency in which zombies update, , requires a powerful machine. Minimum=0 Maximum=10 Default=3
        RerollAttempts = 3,
        -- Definitive Zombies will affect the zombie's speed stat. Disable to improve compatibility between similar mods.
        SpeedEnable = true,
        -- The starting speed of the zombies. Default=Fast Shamblers
        -- 1 = Sprinters
        -- 2 = Fast Shamblers
        Speed = 2,
        -- Definitive Zombies will affect the zombie's strength stat. Disable to improve compatibility between similar mods.
        StrengthEnable = true,
        -- The starting strength of the zombies. Default=Normal
        -- 1 = Superhuman
        -- 2 = Normal
        Strength = 2,
        -- Definitive Zombies will affect the zombie's toughness stat. Disable to improve compatibility between similar mods.
        ToughnessEnable = true,
        -- The starting toughness of the zombies. Default=Normal
        -- 1 = Tough
        -- 2 = Normal
        Toughness = 2,
        -- Definitive Zombies will affect the zombie's cognition stat. Disable to improve compatibility between similar mods.
        CognitionEnable = true,
        -- The starting cognition of the zombies. Default=Basic Navigation
        -- 1 = Navigate + Use Doors
        -- 2 = Navigate
        Cognition = 3,
        -- Definitive Zombies will affect the zombie's hearing stat. Disable to improve compatibility between similar mods.
        HearingEnable = true,
        -- The starting hearing of the zombies. Default=Normal
        -- 1 = Pinpoint
        -- 2 = Normal
        Hearing = 2,
        -- Definitive Zombies will affect the zombie's memory stat. Disable to improve compatibility between similar mods.
        MemoryEnable = true,
        -- The starting memory of the zombies. Default=Normal
        -- 1 = Long
        -- 2 = Normal
        -- 3 = Short
        Memory = 3,
        -- Definitive Zombies will affect the zombie's sight stat. Disable to improve compatibility between similar mods.
        SightEnable = true,
        -- The starting sight of the zombies. Default=Normal
        -- 1 = Eagle
        -- 2 = Normal
        Sight = 2,
        -- Daylight will affect the zombie's stats. Do not modify the intervals unless you know what to do as this is tied to the Night climate
        DayLightEnable = true,
        -- The amount of Daylight needed to modify the zombie stats below. This should be the lowest value among the intervals Minimum=0.01 Maximum=0.99 Default=0.25
        DayLight_Interval0 = 0.25,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        DayLight_Effect0_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        DayLight_Effect0_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        DayLight_Effect0_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        DayLight_Effect0_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        DayLight_Effect0_Memory = 6,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        DayLight_Effect0_Sight = 6,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        DayLight_Effect0_Hearing = 6,
        -- The amount of Daylight needed to modify the zombie stats below. This should be the lowest value among the intervals Minimum=0.01 Maximum=0.99 Default=0.50
        DayLight_Interval1 = 0.5,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        DayLight_Effect1_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        DayLight_Effect1_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        DayLight_Effect1_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        DayLight_Effect1_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        DayLight_Effect1_Memory = 6,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Increase by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        DayLight_Effect1_Sight = 5,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        DayLight_Effect1_Hearing = 6,
        -- The amount of Daylight needed to modify the zombie stats below. This should be the highest value among the intervals Minimum=0.01 Maximum=0.99 Default=0.75
        DayLight_Interval2 = 0.75,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        DayLight_Effect2_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        DayLight_Effect2_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        DayLight_Effect2_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        DayLight_Effect2_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Increase by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        DayLight_Effect2_Memory = 5,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Increase by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        DayLight_Effect2_Sight = 5,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        DayLight_Effect2_Hearing = 6,
        -- Night will affect the zombie's stats. Do not modify the intervals unless you know what to do as this is tied to the Day climate
        NightEnable = true,
        -- How dark the world needs to be to modify the zombie stats below. This should be the lowest value among the intervals Minimum=0.01 Maximum=0.99 Default=0.25
        Night_Interval0 = 0.25,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Night_Effect0_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Night_Effect0_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Night_Effect0_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Night_Effect0_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Night_Effect0_Memory = 6,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Night_Effect0_Sight = 6,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Night_Effect0_Hearing = 6,
        -- How dark the world needs to be to modify the zombie stats below. Value should be in-between Interval0 and Interval2  Minimum=0.01 Maximum=0.99 Default=0.50
        Night_Interval1 = 0.5,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Night_Effect1_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Night_Effect1_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Night_Effect1_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Night_Effect1_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Night_Effect1_Memory = 6,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Decrease by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Night_Effect1_Sight = 7,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Night_Effect1_Hearing = 6,
        -- How dark the world needs to be to to modify the zombie stats below. This should be the highest value among the intervals Minimum=0.01 Maximum=0.99 Default=0.75
        Night_Interval2 = 0.75,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Night_Effect2_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Night_Effect2_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Night_Effect2_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Night_Effect2_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Decrease by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Night_Effect2_Memory = 7,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Decrease by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Night_Effect2_Sight = 7,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Increase by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Night_Effect2_Hearing = 5,
        -- Temperature will affect the zombie's stats.
        TemperatureEnable = true,
        -- The required temperature needed to modify the zombie stats below. This should be the lowest value among the intervals. Do not modify unless you know what to do Minimum=-200.00 Maximum=200.00 Default=-200.00
        Temperature_Interval0 = -200.0,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Decrease by 2 Stages
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Temperature_Effect0_Speed = 8,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Temperature_Effect0_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Increase by 2 Stages
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Temperature_Effect0_Toughness = 4,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Temperature_Effect0_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Increase by 2 Stages
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Temperature_Effect0_Memory = 4,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Temperature_Effect0_Sight = 6,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Temperature_Effect0_Hearing = 6,
        -- The required temperature needed to modify the zombie stats below. Value should be in-between Interval0 and Interval2 Minimum=-200.00 Maximum=200.00 Default=0.00
        Temperature_Interval1 = -10.0,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Decrease by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Temperature_Effect1_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Temperature_Effect1_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Increase by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Temperature_Effect1_Toughness = 5,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Temperature_Effect1_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Increase by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Temperature_Effect1_Memory = 5,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Temperature_Effect1_Sight = 6,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Temperature_Effect1_Hearing = 6,
        -- The required temperature needed to modify the zombie stats below. This should be the highest value among the intervals Minimum=-200.00 Maximum=200.00 Default=10.00
        Temperature_Interval2 = 0.0,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Temperature_Effect2_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Temperature_Effect2_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Temperature_Effect2_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Temperature_Effect2_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Temperature_Effect2_Memory = 6,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Temperature_Effect2_Sight = 6,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Temperature_Effect2_Hearing = 6,
        -- Fog will affect the zombie's stats.
        FogIntensityEnable = true,
        -- The amount of fog needed to modify the zombie stats below. This should be the lowest value among the intervals Minimum=0.01 Maximum=0.99 Default=0.25
        FogIntensity_Interval0 = 0.25,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        FogIntensity_Effect0_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        FogIntensity_Effect0_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        FogIntensity_Effect0_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        FogIntensity_Effect0_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        FogIntensity_Effect0_Memory = 6,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Decrease by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        FogIntensity_Effect0_Sight = 7,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        FogIntensity_Effect0_Hearing = 6,
        -- The amount of fog needed to modify the zombie stats below. Value should be in-between Interval0 and Interval2  Minimum=0.01 Maximum=0.99 Default=0.50
        FogIntensity_Interval1 = 0.5,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        FogIntensity_Effect1_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        FogIntensity_Effect1_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        FogIntensity_Effect1_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        FogIntensity_Effect1_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Decrease by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        FogIntensity_Effect1_Memory = 7,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Decrease by 2 Stages
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        FogIntensity_Effect1_Sight = 8,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        FogIntensity_Effect1_Hearing = 6,
        -- The amount of fog needed to modify the zombie stats below. This should be the highest value among the intervals Minimum=0.01 Maximum=0.99 Default=0.75
        FogIntensity_Interval2 = 0.75,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        FogIntensity_Effect2_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        FogIntensity_Effect2_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        FogIntensity_Effect2_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        FogIntensity_Effect2_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Decrease by 2 Stages
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        FogIntensity_Effect2_Memory = 8,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Decrease by 3 Stages
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        FogIntensity_Effect2_Sight = 9,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        FogIntensity_Effect2_Hearing = 6,
        -- Rain will affect the zombie's stats.
        RainIntensityEnable = true,
        -- The amount of rain needed to modify the zombie stats below. This should be the lowest value among the intervals Minimum=0.01 Maximum=0.99 Default=0.25
        RainIntensity_Interval0 = 0.25,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        RainIntensity_Effect0_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        RainIntensity_Effect0_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        RainIntensity_Effect0_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        RainIntensity_Effect0_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        RainIntensity_Effect0_Memory = 6,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        RainIntensity_Effect0_Sight = 6,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Decrease by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        RainIntensity_Effect0_Hearing = 7,
        -- The amount of rain needed to modify the zombie stats below. Value should be in-between Interval0 and Interval2  Minimum=0.01 Maximum=0.99 Default=0.50
        RainIntensity_Interval1 = 0.5,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        RainIntensity_Effect1_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        RainIntensity_Effect1_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        RainIntensity_Effect1_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        RainIntensity_Effect1_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        RainIntensity_Effect1_Memory = 6,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Decrease by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        RainIntensity_Effect1_Sight = 7,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Decrease by 2 Stages
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        RainIntensity_Effect1_Hearing = 8,
        -- The amount of rain needed to modify the zombie stats below. This should be the highest value among the intervals Minimum=0.01 Maximum=0.99 Default=0.75
        RainIntensity_Interval2 = 0.75,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        RainIntensity_Effect2_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        RainIntensity_Effect2_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        RainIntensity_Effect2_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        RainIntensity_Effect2_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Decrease by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        RainIntensity_Effect2_Memory = 7,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Decrease by 2 Stages
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        RainIntensity_Effect2_Sight = 8,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Decrease by 3 Stages
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        RainIntensity_Effect2_Hearing = 9,
        -- Snow will affect the zombie's stats.
        SnowIntensityEnable = true,
        -- The amount of snow needed to modify the zombie stats below. This should be the lowest value among the intervals Minimum=0.01 Maximum=0.99 Default=0.25
        SnowIntensity_Interval0 = 0.25,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        SnowIntensity_Effect0_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        SnowIntensity_Effect0_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        SnowIntensity_Effect0_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        SnowIntensity_Effect0_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        SnowIntensity_Effect0_Memory = 6,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Decrease by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        SnowIntensity_Effect0_Sight = 7,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        SnowIntensity_Effect0_Hearing = 6,
        -- The amount of snow needed to modify the zombie stats below. Value should be in-between Interval0 and Interval2  Minimum=0.01 Maximum=0.99 Default=0.50
        SnowIntensity_Interval1 = 0.5,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        SnowIntensity_Effect1_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        SnowIntensity_Effect1_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        SnowIntensity_Effect1_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        SnowIntensity_Effect1_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Decrease by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        SnowIntensity_Effect1_Memory = 7,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Decrease by 2 Stages
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        SnowIntensity_Effect1_Sight = 8,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        SnowIntensity_Effect1_Hearing = 6,
        -- The amount of snow needed to modify the zombie stats below. This should be the highest value among the intervals Minimum=0.01 Maximum=0.99 Default=0.75
        SnowIntensity_Interval2 = 0.75,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        SnowIntensity_Effect2_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        SnowIntensity_Effect2_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        SnowIntensity_Effect2_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        SnowIntensity_Effect2_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Decrease by 2 Stages
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        SnowIntensity_Effect2_Memory = 8,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Decrease by 3 Stages
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        SnowIntensity_Effect2_Sight = 9,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        SnowIntensity_Effect2_Hearing = 6,
        -- Clouds will affect the zombie's stats.
        CloudIntensityEnable = true,
        -- The amount of cloud needed to modify the zombie stats below. This should be the lowest value among the intervals Minimum=0.01 Maximum=0.99 Default=0.25
        CloudIntensity_Interval0 = 0.25,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        CloudIntensity_Effect0_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        CloudIntensity_Effect0_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        CloudIntensity_Effect0_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        CloudIntensity_Effect0_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        CloudIntensity_Effect0_Memory = 6,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        CloudIntensity_Effect0_Sight = 6,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        CloudIntensity_Effect0_Hearing = 6,
        -- The amount of cloud needed to modify the zombie stats below. Value should be in-between Interval0 and Interval2  Minimum=0.01 Maximum=0.99 Default=0.50
        CloudIntensity_Interval1 = 0.5,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        CloudIntensity_Effect1_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        CloudIntensity_Effect1_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        CloudIntensity_Effect1_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        CloudIntensity_Effect1_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        CloudIntensity_Effect1_Memory = 6,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Decrease by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        CloudIntensity_Effect1_Sight = 7,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        CloudIntensity_Effect1_Hearing = 6,
        -- The amount of cloud needed to modify the zombie stats below. This should be the highest value among the intervals Minimum=0.01 Maximum=0.99 Default=0.75
        CloudIntensity_Interval2 = 0.75,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        CloudIntensity_Effect2_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        CloudIntensity_Effect2_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        CloudIntensity_Effect2_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        CloudIntensity_Effect2_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Decrease by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        CloudIntensity_Effect2_Memory = 7,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Decrease by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        CloudIntensity_Effect2_Sight = 7,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        CloudIntensity_Effect2_Hearing = 6,
        -- Wind will affect the zombie's stats.
        WindIntensityEnable = true,
        -- The amount of wind needed to modify the zombie stats below. This should be the lowest value among the intervals Minimum=0.01 Maximum=0.99 Default=0.25
        WindIntensity_Interval0 = 0.25,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        WindIntensity_Effect0_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        WindIntensity_Effect0_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        WindIntensity_Effect0_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        WindIntensity_Effect0_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        WindIntensity_Effect0_Memory = 6,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        WindIntensity_Effect0_Sight = 6,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Decrease by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        WindIntensity_Effect0_Hearing = 7,
        -- The amount of wind needed to modify the zombie stats below. Value should be in-between Interval0 and Interval2  Minimum=0.01 Maximum=0.99 Default=0.50
        WindIntensity_Interval1 = 0.5,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        WindIntensity_Effect1_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        WindIntensity_Effect1_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        WindIntensity_Effect1_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        WindIntensity_Effect1_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        WindIntensity_Effect1_Memory = 6,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        WindIntensity_Effect1_Sight = 6,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Decrease by 2 Stages
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        WindIntensity_Effect1_Hearing = 8,
        -- The amount of wind needed to modify the zombie stats below. This should be the highest value among the intervals Minimum=0.01 Maximum=0.99 Default=0.75
        WindIntensity_Interval2 = 0.75,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        WindIntensity_Effect2_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        WindIntensity_Effect2_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        WindIntensity_Effect2_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        WindIntensity_Effect2_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        WindIntensity_Effect2_Memory = 6,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        WindIntensity_Effect2_Sight = 6,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Decrease by 3 Stages
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        WindIntensity_Effect2_Hearing = 9,
        -- Enable to allow the phases of the moon to affect zombies stats
        MoonPhaseEnable = false,
        -- How dark the world needs to be before the moon is able to affect zombies stats. Setting it to 0 will cause the stats to be active throughout the day Minimum=0.00 Maximum=1.00 Default=0.75
        MoonPhaseMoonThreshold = 0.75,
        -- Zombie stats under a new moon Minimum=0.00 Maximum=0.00 Default=0.00
        MoonPhase_Interval0 = 0.0,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect0_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect0_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect0_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect0_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect0_Memory = 6,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect0_Sight = 6,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect0_Hearing = 6,
        -- Zombie stats under a waxing crescent Minimum=1.00 Maximum=1.00 Default=1.00
        MoonPhase_Interval1 = 1.0,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect1_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect1_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect1_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect1_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Increase by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect1_Memory = 5,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect1_Sight = 6,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect1_Hearing = 6,
        -- Zombie stats under a first quarter Minimum=2.00 Maximum=2.00 Default=2.00
        MoonPhase_Interval2 = 2.0,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect2_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect2_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect2_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect2_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Increase by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect2_Memory = 5,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Increase by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect2_Sight = 5,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect2_Hearing = 6,
        -- Zombie stats under a waxing gibbous Minimum=3.00 Maximum=3.00 Default=3.00
        MoonPhase_Interval3 = 3.0,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect3_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect3_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect3_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect3_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Increase by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect3_Memory = 5,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Increase by 2 Stages
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect3_Sight = 4,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect3_Hearing = 6,
        -- Zombie stats under a full moon Minimum=4.00 Maximum=4.00 Default=4.00
        MoonPhase_Interval4 = 4.0,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect4_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect4_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect4_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect4_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Increase by 2 Stages
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect4_Memory = 4,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Increase by 2 Stages
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect4_Sight = 4,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect4_Hearing = 6,
        -- Zombie stats under a waning gibbous Minimum=5.00 Maximum=5.00 Default=5.00
        MoonPhase_Interval5 = 5.0,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect5_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect5_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect5_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect5_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Increase by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect5_Memory = 5,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Increase by 2 Stages
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect5_Sight = 4,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect5_Hearing = 6,
        -- Zombie stats under a third quarter Minimum=6.00 Maximum=6.00 Default=6.00
        MoonPhase_Interval6 = 6.0,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect6_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect6_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect6_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect6_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Increase by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect6_Memory = 5,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Increase by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect6_Sight = 5,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect6_Hearing = 6,
        -- Zombie stats under a  waning crescent Minimum=7.00 Maximum=7.00 Default=7.00
        MoonPhase_Interval7 = 7.0,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect7_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect7_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect7_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect7_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Increase by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect7_Memory = 5,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect7_Sight = 6,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        MoonPhase_Effect7_Hearing = 6,
        -- In-game time will affect the zombie's stats
        TimeEnable = false,
        -- The required in-game time before the following stats becomes active. This should be the lowest value among the intervals Minimum=0.00 Maximum=24.00 Default=4.00
        Time_Interval0 = 4.0,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Time_Effect0_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Time_Effect0_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Time_Effect0_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Time_Effect0_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Time_Effect0_Memory = 6,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Time_Effect0_Sight = 6,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Time_Effect0_Hearing = 6,
        -- The required in-game time before the following stats becomes active. This should be the highest value among the intervals Minimum=0.00 Maximum=24.00 Default=18.00
        Time_Interval1 = 18.0,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Time_Effect1_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Time_Effect1_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Time_Effect1_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Time_Effect1_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Time_Effect1_Memory = 6,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Time_Effect1_Sight = 6,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Time_Effect1_Hearing = 6,
        -- Zombies react to the number of days the world has been active for.
        EntropyEnable = false,
        -- The number of in-game days which have elasped needed to modify the zombie stats below. This should be the lowest value among the intervals Minimum=1 Maximum=9999 Default=28
        Entropy_Interval0 = 28,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Entropy_Effect0_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Entropy_Effect0_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Entropy_Effect0_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Entropy_Effect0_Cognition = 6,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Entropy_Effect0_Memory = 6,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Decrease by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Entropy_Effect0_Sight = 7,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Decrease by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Entropy_Effect0_Hearing = 7,
        -- The number of in-game days which have elasped. Value should be in-between Interval0 and Interval2  Minimum=1 Maximum=99999 Default=196
        Entropy_Interval1 = 196,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Entropy_Effect1_Speed = 6,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Entropy_Effect1_Strength = 6,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Entropy_Effect1_Toughness = 6,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Decrease by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Entropy_Effect1_Cognition = 7,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Decrease by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Entropy_Effect1_Memory = 7,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Decrease by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Entropy_Effect1_Sight = 7,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Decrease by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Entropy_Effect1_Hearing = 7,
        -- The number of in-game days which have elasped. This should be the highest value among the intervals Minimum=1 Maximum=9999 Default=851
        Entropy_Interval2 = 851,
        -- The zombie's speed will be modified by this amount if the climate interval above is achieved. Default=Decrease by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Entropy_Effect2_Speed = 7,
        -- The zombie's strength will be modified by this amount if the climate interval above is achieved. Default=Decrease by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Entropy_Effect2_Strength = 7,
        -- The zombie's toughness will be modified by this amount if the climate interval above is achieved. Default=Decrease by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Entropy_Effect2_Toughness = 7,
        -- The zombie's cognition will be modified by this amount if the climate interval above is achieved. Default=Decrease by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Entropy_Effect2_Cognition = 7,
        -- The zombie's memory will be modified by this amount if the climate interval above is achieved. Default=Decrease by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Entropy_Effect2_Memory = 7,
        -- The zombie's sight will be modified by this amount if the climate interval above is achieved. Default=Decrease by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Entropy_Effect2_Sight = 7,
        -- The zombie's hearing will be modified by this amount if the climate interval above is achieved. Default=Decrease by 1 Stage
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Entropy_Effect2_Hearing = 7,
        -- Enable randomisation for the Speed stat. Chances will be normalised at the end
        Speed_Seed_Enable = true,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Speed_Seed1 = 7.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Speed_Seed1_Effect = 5,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Speed_Seed2 = 30.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Speed_Seed2_Effect = 7,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Speed_Seed3 = 10.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Speed_Seed3_Effect = 8,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Speed_Seed4 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Speed_Seed4_Effect = 6,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Speed_Seed5 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Speed_Seed5_Effect = 6,
        -- Enable randomisation for the Strength stat. Chances will be normalised at the end
        Strength_Seed_Enable = false,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Strength_Seed1 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Strength_Seed1_Effect = 6,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Strength_Seed2 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Strength_Seed2_Effect = 6,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Strength_Seed3 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Strength_Seed3_Effect = 6,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Strength_Seed4 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Strength_Seed4_Effect = 6,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Strength_Seed5 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Strength_Seed5_Effect = 6,
        -- Enable randomisation for the Toughness stat. Chances will be normalised at the end
        Toughness_Seed_Enable = false,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Toughness_Seed1 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Toughness_Seed1_Effect = 6,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Toughness_Seed2 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Toughness_Seed2_Effect = 6,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Toughness_Seed3 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Toughness_Seed3_Effect = 6,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Toughness_Seed4 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Toughness_Seed4_Effect = 6,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Toughness_Seed5 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Toughness_Seed5_Effect = 6,
        -- Enable randomisation for the Cognition stat. Chances will be normalised at the end
        Cognition_Seed_Enable = false,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Cognition_Seed1 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Cognition_Seed1_Effect = 6,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Cognition_Seed2 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Cognition_Seed2_Effect = 6,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Cognition_Seed3 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Cognition_Seed3_Effect = 6,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Cognition_Seed4 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Cognition_Seed4_Effect = 6,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Cognition_Seed5 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Cognition_Seed5_Effect = 6,
        -- Enable randomisation for the Memory stat. Chances will be normalised at the end
        Memory_Seed_Enable = false,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Memory_Seed1 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Memory_Seed1_Effect = 6,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Memory_Seed2 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Memory_Seed2_Effect = 6,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Memory_Seed3 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Memory_Seed3_Effect = 6,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Memory_Seed4 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Memory_Seed4_Effect = 6,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Memory_Seed5 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Memory_Seed5_Effect = 6,
        -- Enable randomisation for the Sight stat. Chances will be normalised at the end
        Sight_Seed_Enable = false,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Sight_Seed1 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Sight_Seed1_Effect = 6,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Sight_Seed2 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Sight_Seed2_Effect = 6,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Sight_Seed3 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Sight_Seed3_Effect = 6,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Sight_Seed4 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Sight_Seed4_Effect = 6,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Sight_Seed5 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Sight_Seed5_Effect = 6,
        -- Enable randomisation for the Hearing stat. Chances will be normalised at the end
        Hearing_Seed_Enable = false,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Hearing_Seed1 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Hearing_Seed1_Effect = 6,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Hearing_Seed2 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Hearing_Seed2_Effect = 6,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Hearing_Seed3 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Hearing_Seed3_Effect = 6,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Hearing_Seed4 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Hearing_Seed4_Effect = 6,
        -- The chance that a zombie will have its stat modified Minimum=0.00 Maximum=100.00 Default=20.00
        Hearing_Seed5 = 20.0,
        -- Default=Nothing
        -- 1 = Increase by 99 Stages
        -- 2 = Increase by 4 Stages
        -- 3 = Increase by 3 Stages
        -- 4 = Increase by 2 Stages
        -- 5 = Increase by 1 Stage
        -- 6 = Nothing
        -- 7 = Decrease by 1 Stage
        -- 8 = Decrease by 2 Stages
        -- 9 = Decrease by 3 Stages
        -- 10 = Decrease by 4 Stages
        Hearing_Seed5_Effect = 6,
    },
    DAMN = {
        AllowVanillaVehicleDismantling = true,
        AllowVanillaWorldItemDismantling = true,
        AllowPowerChadSpawns = false,
        AllowManlyMANSpawns = false,
        AllowGreatScottSpawns = false,
        AlLAV300Spawns = false,
        AllowfUNSpawns = false,
        AllowMrBusSpawns = false,
        AllowChonkerSpawns = false,
        AllowCashcowSpawns = false,
        AllowMcBoxySpawns = false,
        AllowBushmasterSpawns = false,
    },
    DaysGone = {
        -- Displays "Days Later" instead of "Days Gone".
        -- A reference to the 2002 movie. 
        DaysLater = true,
        -- Includes the Knox Evacuation, 3 days before the game starts, in the day counter. 
        IncludePreOutbreak = false,
        -- Write some custom text after the day count instead of 'Days Gone'.
        -- Leave it blank for default. 
        CustomText = "",
        -- Add a custom starting day to the counter.
        -- The mod will calculate current world days + the starting day. Minimum=0 Maximum=1000000 Default=0
        StartingDay = 0,
    },
    KillCount = {
        -- May provoke stutters.
        doExport = false,
        -- Includes all kills into the final value in Post Death floating text.
        includePostDeathUI = true,
        -- Target time (in milliseconds) between two updates in multiplayer. Small value gives reactivity. High value reduces network use and server workload. Minimum=0 Maximum=10000000 Default=500
        MaxUpdateDelay = 500,
        -- Each client can see every character score. Deactivate on (very large) servers to reduce Global Mod Data transfer load.
        shareOnServer = true,
        -- Dead characters are kept and count toward server kills. Deactivate for server that never wipe.
        keepTrackOfDead = true,
    },
    LingeringVoices = {
        -- Zombies react to zombie talking like the player shout
        RespondToSound = true,
        -- Whether to use the custom lines in USERNAME/Zomboid/Lua/talkingDeadCustomLine.lua
        CustomLines = true,
        -- Minimum amount of seconds that need to pass before another line is said by a zombie. Minimum=0 Maximum=604800 Default=5
        LowerLineLimit = 5,
        -- Maximum amount of seconds that need to pass before another line is said by a zombie. Minimum=0 Maximum=604800 Default=86400
        UpperLineLimit = 86400,
        -- Chance out of 1000 for a zombie to speak when hit. Minimum=0 Maximum=1000 Default=1
        StaggerSpeakChance = 1,
    },
    OutOfBreathMoodle = {
        -- At 0.75, the vanilla Moderate Exertion moodle pops up. Set this value to be between 0.75 and 1.0 where 1.0 is the most rested the player can be. Minimum=0.75 Maximum=1.00 Default=0.80
        OutOfBreathAt = 0.8,
    },
    PlumbHelper = {
        -- This option is just for translation credits. It doesn't do anything. 
        -- 
        -- Stop me if you've heard this one. 
        -- 
        -- 12 zombies walk into a bathroom...
        WelcomeSeparator = false,
        -- Show Water On/Off status on Plumb Helper tooltip. 
        -- 
        -- Not OP, but it's a bit unimmersive so it's optional.
        Utilities = true,
    },
    MoreMaps = {
        -- As junk items, with the same chance as the vanilla maps, some rarer.
        ForageableMaps = true,
        -- All map items added will have their loot chances multiplied by this value.
        -- Use this to tweak loot chances according to the number of maps you use.
        -- By default(=1) it is balanced for when most maps are enabled. Minimum=0.00 Maximum=4.00 Default=1.00
        MapLootMultiplier = 0.03,
        -- Extremely rare - disabled by default
        KentuckyCompleteMap = false,
        -- Very rare
        LouisVilleCompleteMap = true,
        -- 15 districts in total
        -- Enabling this will remove the vanilla Louisville Maps, including annotated ones !
        LouisVilleDistrictMaps = true,
        -- Dixie and Scenic Grove
        TrailerParkMaps = true,
        ValleyStationMap = true,
        ValleyStationMallAreaMap = true,
        -- South of Valley Station's mall
        EasternSummerCampMap = true,
        AbandonedFactoryMap = false,
        -- Works with the New Ekron mod too.
        EkronMap = true,
        -- Rare, mainly found on military loot
        MilitaryMaps = true,
        -- Between Grapeseed and Ravencreek.
        FortRedstoneMap = false,
        -- North West of Muldraugh. Rare. Disabled if military maps are disabled
        MilitaryAirportMap = false,
        -- South of Riverside's Country Club.
        FortBenningMap = false,
        -- East of Riverside's Country Club, North of Ekron.
        FortRockRidgeMap = false,
        -- East of Muldraugh
        MuldraughMilitaryBaseMap = false,
        -- Between Rosewood and Muldraugh
        FortWaterfrontMap = false,
        -- South of Bedford Falls, East of Eerie Country. Quitman Map, Fort Knox Map. Rare.
        FortKnoxMaps = false,
        -- Can also be found in golfer bags
        RiversideCountryClubMap = true,
        -- The one with the camping & military gear store
        SmallTownWestMap = true,
        PonyRoamOMap = true,
        -- East of Muldraugh
        MuldraughRailyardMap = true,
        -- South West of Muldraugh
        MuldraughWarehouseComplexMap = true,
        -- 5 in total, only found on zombies, rare. Useful to find Antique Ovens.
        CabinLocations = true,
        -- East of Dixie
        CampGroundsLocation = true,
        -- West of Rosewood
        GrapeseedMap = true,
        -- North of Rosewood
        BlackwoodMap = true,
        -- Between Rosewood and Muldraugh
        PitstopMap = false,
        -- North of West Point, on the other side of the river
        OverTheRiverMap = false,
        -- West of Muldraugh
        LakeIvyMap = true,
        -- From the mod Save Our Station!
        WeatherStationLocations = true,
        -- West of Rosewood and Grapeseed. Very rare map item.
        CompleteRavenCreekMap = false,
        -- 3 district maps
        RavenCreekDistrictMaps = false,
        -- North of Rosewood
        RosewoodExpansionMap = false,
        -- North West of March Ridge
        MarchRidgeExpansionMap = true,
        -- North West of March Ridge
        CONResearchMap = true,
        -- North West of Rosewood
        GreenleafMap = true,
        -- Between Ekron and Pony Roam-O
        LittleTownshipMap = true,
        -- Between Dixie and crossroads
        LindenMap = false,
        -- South West of Riverside
        RefordvilleMap = false,
        --        
        ChernavilleMap = false,
        -- North of Muldraugh, West of Dixie
        ChinatownMap = false,
        -- West of Rosewood, after Grapeseed
        BlueberryMap = false,
        -- South of West Point
        WestPointSouthTrailerParkMap = true,
        -- An island in the Ohio river, in the North West corner of the map
        KingsmouthMap = false,
        -- East of Dixie
        SurvivorWarehouseLocation = true,
        -- North West of West Point, East of Riverside's Country Club on the other side of the river
        CoryerdonMap = false,
        -- South of Ed's Auto Salvage
        OldParkTownMap = false,
        WestPointExpansionMap = false,
        GlenportMap = false,
        -- Very rare
        CompleteEerieCountryMap = false,
        -- Centralia, Hidden swamps, Rural Zone, Eren City, Irvington, train station...
        EerieCountryDifferentMaps = false,
        -- Far South West. Silverton Map, Rosebery Map, New Denver Map.
        SlocanLakeMaps = false,
        -- South of West Point
        BillionaireSafehouseLocation = false,
        -- West of Riverside's Country Club
        WildberriesMap = false,
        -- East of Muldraugh's Railyard
        TugalandMap = false,
        -- East of Rosewood, West of Grapeseed
        RemusMap = false,
        -- West of Louisville
        TrimbleCountyMaps = true,
        -- East of West Point
        EZPZCommunityCenterMap = false,
        -- South of March Ridge
        OldPineVillageMap = false,
        -- An island in the river, North East of Louisville,
        ChristmasVillageMap = false,
        -- North East of Muldraugh, West of Ekron
        HyruleCountyMap = false,
        -- North of Ekron
        RiverwoodMap = false,
        -- North of East of Valley Station's Mall
        HongKongYauMaTeiMap = false,
        -- South West of Ekron
        WesternMilitaryComplexMap = false,
        -- South East of Muldraugh
        MansionAdress = false,
        -- South East of Muldraugh
        ConstructionFactoryMap = false,
        WestwoodMap = false,
        AnthemMap = false,
        LaconiaMap = false,
        AshenwoodMap = false,
        ElysiumIslandMap = false,
        HopewellMap = true,
        WalnutRidgeMap = false,
        HeavensHillMansionAdress = false,
        ChestownMap = false,
        NashvilleMap = false,
        OverlookHotelMap = false,
        PerfectShelterMap = false,
        OConnorFarmAddress = false,
        LincolnRegionalAirportMap = false,
        MuldraughWesternShippingCompanyMap = false,
        RosewoodMilitaryHospitalMap = false,
        TheMuseumMap = true,
        TheEyeLakeMap = false,
        AddamsFamilyMansionMap = false,
        JeffersonvilleMap = false,
        CherokeeLakeMap = false,
        RiversideMansionMap = false,
        FinneganMentalAsylumMap = false,
        PapavilleMap = false,
        SouthTownMap = false,
        ChinatownMapExpansionMap = false,
        LouisvilleBunkerLocationMap = false,
        OrchidwoodMap = false,
        WinchesterMap = false,
        BreakpointMap = false,
        WilboreMap = false,
        PetrovilleMap = false,
        CedarHillMap = false,
        CathayaValleyMap = false,
        SpringwoodMap = false,
        NaturesVengeanceTownshipMap = false,
        BigBearLakeMaps = true,
        SimsZomboidMap = false,
        DirkerdamMaps = false,
        LakeCumberlandMaps = true,
        PharmaceuticalFactoryMap = false,
        NettleTownshipMap = true,
        StMooseHospitalMap = false,
        ShortrestCountyMap = false,
        LeavenburgMap = false,
        BunkerDayOfTheDeadMap = false,
        SuperGigaMartMap = false,
        ZtardewValleyMap = false,
        TheWalkingDeadPrisonMap = false,
        TheWalkingDeadTerminusMap = false,
        HuntersBaseMap = false,
        PortCityMap = false,
        SpringValleyMap = false,
        OakshireMap = false,
        RangersHomesteadMap = false,
        FrigateMap = true,
        BunkerLastMinutePrepperMap = false,
        LouisvilleQuarantineZoneMap = false,
        LVInternationalAirport = true,
        MuldraughCheckpointMap = false,
        SpeckMap = false,
        HomesteadWindyMap = false,
        MilitaryFuelDepotMap = true,
        SpencerMansionMap = false,
        UncleRedsBunkerMap = false,
        HopefallsMap = true,
        VineGroveMap = false,
        LouisianaMap = false,
        CaliforniaMaps = false,
        WeyhausenMap = false,
        DaisyCountyMap = false,
        McCoysBunkerMap = false,
        OtterCreekMap = false,
        WellsburgLakeMap = false,
        FortBoonesboroughMap = true,
        CrowlakeMap = true,
        GustonMap = true,
        JaspervilleMap = false,
        YakamaStateParkMap = true,
        ValuTechAmusementParkMap = false,
        CanvasbackStudiosMap = true,
        PlefordSpringsMap = false,
        FoxWoodMap = false,
        BrazilMap = false,
        FortLoidMap = false,
        HavenRidgeMap = false,
    },
    SOTO = {
        -- Possibility to obtain XP boosts while leveling agility skills.
        -- For example player can obtain Sneaky trait to increase their XP gain for Sneaking skill.
        AgilityTraitsObtainable = true,
        -- Possibility to obtain XP boosts while leveling combat skills.
        -- For example player can obtain Baseball Player trait to increase their XP gain for Long Blunt skill.
        CombatTraitsObtainable = true,
        -- Possibility to obtain XP boosts while leveling survivalist skills.
        -- For example player can obtain Forager trait to increase their XP gain for Foraging skill.
        SurvTraitsObtainable = false,
        -- Possibility to obtain XP boosts while leveling crafting skills.
        -- For example player can obtain Scullion trait to increase their XP gain for Cooking skill.
        CraftTraitsObtainable = false,
        -- Possibility to obtain XP boosts while leveling firearm skills.
        -- For example player can obtain Shooter trait to increase their XP gain for Aiming skill.
        FirearmTraitsObtainable = true,
        -- Player can earn 1 Fitness XP once per game minute with 50% chance while running.
        AddFitXPWhileRun = true,
        -- Should be lower than Max. 1 day = 24 Minimum=1 Maximum=100000 Default=168
        LoseCowardlyHoursMIN = 168,
        -- Should be higher than Min. 1 day = 24 Minimum=1 Maximum=100000 Default=336
        LoseCowardlyHoursMAX = 336,
        -- Should be lower than Max. Minimum=1 Maximum=100000 Default=1250
        LoseCowardlyZombMIN = 850,
        -- Should be higher than Min. Minimum=1 Maximum=100000 Default=2500
        LoseCowardlyZombMAX = 2000,
        -- Should be lower than Max. 1 day = 24
        -- x1.2 when starting with Cowardly trait. Minimum=1 Maximum=100000 Default=504
        EarnBraveHoursMIN = 504,
        -- Should be higher than Min. 1 day = 24
        -- x1.2 when starting with Cowardly trait. Minimum=1 Maximum=100000 Default=840
        EarnBraveHoursMAX = 840,
        -- Should be lower than Max.
        -- x1.2 when starting with Cowardly trait. Minimum=1 Maximum=100000 Default=3000
        EarnBraveZombMIN = 2800,
        -- Should be higher than Min.
        -- x1.2 when starting with Cowardly trait. Minimum=1 Maximum=100000 Default=4500
        EarnBraveZombMAX = 4200,
        -- Should be lower than Max. 1 day = 24
        -- x1.2 when starting with Cowardly trait.
        -- x0.8 when starting with Brave trait. Minimum=1 Maximum=100000 Default=1176
        EarnDesensitizedHoursMIN = 1176,
        -- Should be higher than Min. 1 day = 24
        -- x1.2 when starting with Cowardly trait.
        -- x0.8 when starting with Brave trait. Minimum=1 Maximum=100000 Default=1512
        EarnDesensitizedHoursMAX = 1512,
        -- Should be lower than Max.
        -- x1.2 when starting with Cowardly trait.
        -- x0.8 when starting with Brave trait. Minimum=1 Maximum=100000 Default=6000
        EarnDesensitizedZombMIN = 5500,
        -- Should be higher than Min.
        -- x1.2 when starting with Cowardly trait.
        -- x0.8 when starting with Brave trait. Minimum=1 Maximum=100000 Default=9000
        EarnDesensitizedZombMAX = 8000,
        -- Should be lower than Max. 1 day = 24 Minimum=1 Maximum=100000 Default=672
        LosePacifistHoursMIN = 672,
        -- Should be higher than Min. 1 day = 24 Minimum=1 Maximum=100000 Default=1008
        LosePacifistHoursMAX = 1008,
        -- Should be lower than Max. Minimum=1 Maximum=100000 Default=1500
        LosePacifistZombMIN = 1500,
        -- Should be higher than Min. Minimum=1 Maximum=100000 Default=2500
        LosePacifistZombMAX = 2500,
        -- Any weapon skill but Maintenance and Reloading. Minimum=0 Maximum=10 Default=7
        LosePacifistSkillLvl = 7,
    },
    EvolvingTraitsWorld = {
        -- Defines if the Affinity System is enabled for some traits tied to systems and some complex ones (for example, weight Fear of Locations system, Herbalist, or Sleep System. Check which Systems and Traits are subject to the Affinity system in Google Sheets).
        -- The Affinity system makes it easier to hold onto traits you picked during character creation, both negative and positive. With it enabled, you halve (modifiable) the speed at which you lose these traits, and double (also modifiable) the speed at which you earn these traits
        AffinitySystem = true,
        -- How much harder it is to lose perks that have Affinity System functionality (only affects perks you started with!). Setting it to 1 would mean that it doesn't make it harder to lose. Setting it to 2 means you'll be twice as slow to lose them. Setting it to 1.5 would make it 50% slower, and so on. So if you start with a positive trait that you can lose, it'll be much harder to lose it. But it also affects negative traits! Minimum=1.00 Maximum=100.00 Default=2.00
        AffinitySystemLoseDivider = 2.0,
        -- How much easier it is to gain perks that have Affinity System functionality (only affects perks you started with!). Setting it to 1 would mean that it doesn't make it easier to gain. Setting it to 2 means it'll take twice as fast to gain them. Setting it to 1.5 would make it 50% faster, and so on. So if you start with a positive dynamic trait and later lose it, you'll get it back much faster. But it also affects negative traits! Minimum=1.00 Maximum=100.00 Default=2.00
        AffinitySystemGainMultiplier = 2.0,
        -- This system allows you to gain/lose traits in a more random and less predictable way. When you qualify to add/remove a trait (list of affected traits can be found in the Google Sheets linked in the workshop description), it doesn't happen instantly. Instead, it's added to a table with a delay in hours (based on sandbox settings below). Every hour, the game rolls to determine if you gain/lose each trait in this table (each trait is rolled separately). You have a 1 in X chance to gain/lose the trait every hour. If the roll fails, X is reduced by 1. So the longer you go, the higher the chances that the trait you earned will manifest.
        -- IMPORTANT: Traits that rely on skill levels will be unlocked as described above. However, traits that rely on internal counters added by this mod (e.g., Prone To Illness, Weak Stomach, Outdoorsman, Cat Eyes, etc.) will unlock the next time their internal counters increase. This is because coding a separate unlock mechanism for these specific traits would be complex and unnecessary. For example, if you qualify for Cat Eyes and it's added to the Delayed Traits Table, you won't get it immediately. Instead, you'll get it as soon as the Cat Eyes counter increases next time (e.g., the closest evening/night). Specific cases are noted on the Google Sheets
        DelayedTraitsSystem = true,
        -- Default delay (in hours) for traits to appear/disappear. For example, if set to 240, when you qualify for a new trait, you'll have a 1 in 240 chance to gain/lose it in the first hour. If it fails, the chance becomes 1 in 239 the next hour, and so on Minimum=1 Maximum=5000 Default=336
        DelayedTraitsSystemDefaultDelay = 336,
        -- Additional delay (in hours) stacked on top of the default delay for 'free' traits obtained at the start of the game. For example, starting with 9 Strength would usually grant Hoarder for free. If the Delayed Traits system is enabled, with a Default Delay of 240 and Additional Delay for Starting Traits of 480, you won't get Hoarder at the start. Instead, it goes into the table with a maximum delay of 720 hours. So, you'll have a 1 in 720 chance to get it in the first hour, and so on Minimum=1 Maximum=5000 Default=504
        DelayedTraitsSystemDefaultStartingDelay = 504,
        -- This will enable a page in the character screen with detailed information on your progress in losing/gaining traits
        UIPage = true,
        BraverySystem = false,
        -- Here you set up how many kills you need to get to max out your bravery system. Melee kills count twice for progress. Progression is as follows: Cowardly -> Fear of Blood -> Pacifist -> Adrenaline Junkie -> Brave -> Desensitized
        -- You need to have previous trait gone (if it's negative) or present (if it's positive) to earn/lose next trait In progression.
        -- Amounts to reach each stage are as follows:
        -- Cowardly: 10% of max kills
        -- Fear of Blood: 20% of max kills
        -- Pacifist: 30% of max kills
        -- Adrenaline Junkie: 40% of max kills
        -- Brave: 60% of max kills
        -- Desensitized: 100% of max kills
        -- Example: Max kills is set to 1000. You start with Cowardly. You need 100 kills to remove it. If you get 50 melee kills, it'll be removed. The same is true if you get 40 melee kills (x2 = 80 kills for the counter) and 20 firearms kills Minimum=0 Maximum=500000 Default=20000
        BraverySystemKills = 20000,
        -- If enabled, getting desensitized through the Bravery system will also remove other fear perks like Pluviophile, Homichlophobia, Agoraphobic, and Claustrophobic, and prevent you from gaining them
        BraverySystemRemovesOtherFearPerks = false,
        FearOfLocationsSystem = true,
        -- If enabled, you will only ever have Claustrophobic OR Agoraphobic, whichever has the lower counter
        FearOfLocationsExclusiveFears = true,
        -- If you have an issue managing both Agoraphobic and Claustrophobic traits simultaneously, you can set up passive decay using this option. This slowly decays the opposite counter based on whether you're outside/inside every minute, regardless of your mental state. For example, setting this to 0.1 and being inside will gradually reduce your fear of outside by adding 0.1 to the outside counter every minute. Setting it to 0 will have no effect on counters. Recommended values range from 0.1 to 0.5 Minimum=0.00 Maximum=8.00 Default=0.00
        FearOfLocationsSystemPassiveCounterDecay = 0.0,
        -- Counter = amount of minutes you need to spend outside/inside to lose the respective trait, Agoraphobic or Claustrophobic. Being outside/inside when stressed or unhappy will decrease the counter. Reaching a negative counter value will GAIN you the appropriate trait. Reaching a positive counter value will get rid of the appropriate trait, being in between -counter and +counter will result in no change. The lower boundary is -2x of the counter, and the upper boundary is 2x of the set value here Minimum=0 Maximum=500000 Default=12000
        FearOfLocationsSystemCounter = 12000,
        -- Controls how fast the counter decreases when you are unhappy (50%+) or stressed (50%+). Since you are more often normal than unhappy or stressed, it's recommended not to set this value too low. The formula for how much the counter decreases every minute is: 1 * (1 + unhappiness(0-1)) + (1 * stress(0-1)) * multiplier. At minimum, you lose 0 * multiplier; at maximum, you lose 4 * multiplier Minimum=0.00 Maximum=100.00 Default=1.00
        FearOfLocationsSystemCounterLoseMultiplier = 1.0,
        FogSystem = true,
        -- You gain progress every minute you spend in fog. Being panicked can slow down the process or even revert it. If the counter is below -counter, you gain Homichlophobia; when reaching counter, you gain Homichlophile. If the counter is between these values, there is no effect. Making a kill at during fog triggers extra execution of function responsible for gaining/losing progress (so instead of getting progress 1 time / minute you can get progress 3 times per minute, for example) Minimum=0 Maximum=500000 Default=20000
        FogSystemCounter = 20000,
        -- Adjusts the rate at which your counter increases. See tooltip for details in Fog System Counter Minimum=0.00 Maximum=100.00 Default=10.00
        FogSystemCounterIncreaseMultiplier = 10.0,
        -- Adjusts the rate at which your counter decreases. See tooltip for details in Fog System Counter Minimum=0.00 Maximum=100.00 Default=10.00
        FogSystemCounterDecreaseMultiplier = 10.0,
        FoodSicknessSystem = true,
        -- Determines how much food sickness you need to accumulate to lose/gain Food Sickness-related traits, Weak Stomach and Iron Gut. Sickness can range from 0 to 1, where 1 can lead to death. Each minute, your current food sickness level is added to the counter. Minimum=0 Maximum=500000 Default=40000
        FoodSicknessSystemCounter = 40000,
        -- Minimum=0.00 Maximum=100.00 Default=0.10
        FoodSicknessSystemNormalSicknessMultiplier = 0.1,
        HearingSystem = true,
        -- Determines how many levels in Agility + Combat (excluding Maintenance) you need to obtain/lose hearing-related perks (Hard Of Hearing and Keen Hearing). You lose Hard of Hearing when you surpass half of the required levels and gain Keen Hearing upon reaching the specified number Minimum=0 Maximum=100 Default=80
        HearingSystemSkill = 80,
        ImmuneSystem = true,
        -- Upon reaching the half of value on this counter you lose Prone to Illness, upon reaching the value you gain Resilient. Every minute current cold strength is added to the counter. Being infected with Knox Infection also contributes to counter (so if you run mods that can help you fight infection, like Antibodies, it will help with Immunity System) Minimum=0 Maximum=500000 Default=9000
        ImmunitySystemCounter = 9000,
        -- This is multiplier how much Knox infection level contributes to Immunity System progress. Minimum=0.00 Maximum=100.00 Default=10.00
        ImmunitySystemInfectionMultiplier = 10.0,
        InventoryTransferSystem = true,
        -- Specifies how many items (and their weight) you need to transfer to earn/lose traits related to item transfer: Disorganized, Organized, All Thumbs, Dexterous, Butterfingers (More Traits).
        -- Disorganized: 66% of Weight counter and 33% of Items counter
        -- Organized: 100% of Weight counter and 66% of Items counter
        -- All Thumbs: 33% of Weight counter and 66% of Items counter
        -- Dexterous: 66% of Weight counter and 100% of Items counter
        -- Butterfingers (More Traits): 150% of Weight counter and 150% of Items counter Minimum=0 Maximum=2500000 Default=40000
        InventoryTransferSystemItems = 40000,
        -- Specifies how much weight (and how many items) you need to transfer to earn/lose traits related to item transfer: Disorganized, Organized, All Thumbs, Dexterous, Butterfingers (More Traits).
        -- Disorganized: 66% of Weight counter and 33% of Items counter
        -- Organized: 100% of Weight counter and 66% of Items counter
        -- All Thumbs: 33% of Weight counter and 66% of Items counter
        -- Dexterous: 66% of Weight counter and 100% of Items counter
        -- Butterfingers (More Traits): 150% of Weight counter and 150% of Items counter Minimum=0 Maximum=2500000 Default=30000
        InventoryTransferSystemWeight = 30000,
        LearnerSystem = true,
        -- Specifies the skill levels required to lose Slow Learner and gain Fast Learner. Slow Learner is lost upon reaching half of the required levels, while Fast Learner is gained upon reaching the specified number of levels. Skills included: Maintenance, Carpentry, Cooking, Farming, First Aid, Electrical, Metalworking, Mechanics, Tailoring Minimum=0 Maximum=90 Default=60
        LearnerSystemSkill = 60,
        LuckSystem = true,
        -- Specifies the percentage of total skill levels required to reach maximum Luck system benefits. The code counts all your skill levels, including those added by mods and passives, to determine when you lose Unlucky and gain Lucky traits. Unlucky is lost when you reach half of the percentage you set. For example, with default settings, Unlucky is lost when the sum of your skill levels is 33% or higher from the maximum, and Lucky is gained when you reach 66% Minimum=0.00 Maximum=100.00 Default=66.00
        LuckSystemSkill = 66.0,
        RainSystem = true,
        -- You gain progress every minute you spend in rain while outside. Being panicked can slow down the process or even revert it. If the counter is below -counter, you gain Pluviophobia; when reaching counter, you gain Pluviophile. If the counter is between these values, there is no effect. Making a kill at during rain triggers extra execution of function responsible for gaining/losing progress (so instead of getting progress 1 time / minute you can get progress 3 times per minute, for example) Minimum=0 Maximum=500000 Default=40000
        RainSystemCounter = 40000,
        -- Adjusts the rate at which your Rain System Counter increases, detailed in Rain System Counter tooltip Minimum=0.00 Maximum=100.00 Default=10.00
        RainSystemCounterIncreaseMultiplier = 10.0,
        -- Adjusts the rate at which your Rain System Counter decreases, detailed in Rain System Counter tooltip Minimum=0.00 Maximum=100.00 Default=10.00
        RainSystemCounterDecreaseMultiplier = 10.0,
        -- Enables obtaining/losing sleep-related traits, Wakeful and Sleepyhead. 
        -- ---General description---
        -- Mod tracks at which hours you like to sleep, and as long as you sleep within around those hours, you reinforce your healthy sleep schedule. If you sleep outside of it, you lose some schedule integrity. Not sleeping for more than 24 hours also starts to damage your sleep schedule. Mod tracks at which hours you like to sleep by checking the midpoint of your last sleep, so it's possible to shift your schedule to different hours.
        -- ---Technical description, don't read this if you don't want to meta-game much---
        -- Every time you sleep, the mod tracks the midpoint of your sleep. For example, if you sleep between 23:00 and 05:30, the midpoint would be 03:45, and it would be your optimal sleeping hour. If you sleep within +-6 hours of this time, you gain progress to your SleepHealthiness bar, which ranges from -200 to 200. A check is made every 10 minutes, adding +0.167 to the bar if sleeping within the correct schedule, essentially giving +1 for every hour of correct sleep. Sleeping outside this schedule removes 0.167 from the bar every 10 minutes. After not sleeping for more than 24 hours, you start losing -0.167 every ten minutes. If your bar falls below -100, you get Sleepyhead. If it's above 100, you get Wakeful. Starting with either trait sets the starting value of the bar to its maximum or minimum point: +200 for Wakeful and -200 for Sleepyhead
        SleepSystem = false,
        -- Determines how fast you increase/decrease the SleepHealthiness counter, which dictates if you get/lose Wakeful and Sleepyhead. Higher values mean faster gain and loss. Lower values mean slower gain and loss Minimum=0.00 Maximum=100.00 Default=1.00
        SleepSystemMultiplier = 1.0,
        -- If this is enabled, you can lose positive traits during gameplay. This mostly applies to trait systems like love/fear of weather/locations or weight system as not a lot of positive traits can be lost
        TraitsLockSystemCanLosePositive = true,
        -- If this is enabled, you can gain positive traits during gameplay. This applies to a lot of traits; you DO NOT want to have this disabled
        TraitsLockSystemCanGainPositive = true,
        -- If this is enabled, you can lose negative traits during gameplay. This mostly applies to trait systems like love/fear of weather/locations or weight system and also a bunch of simple traits
        TraitsLockSystemCanLoseNegative = true,
        -- If this is enabled, you can gain negative traits during gameplay. This mostly applies to trait systems like love/fear of weather/locations or weight system as not a lot of negative traits can be earned
        TraitsLockSystemCanGainNegative = true,
        -- Describing conditions on which you lose/gain traits in here would take a lot of text, so just check Google Sheets for details (link in mod workshop page description). Affected traits that can be gained/lost dynamically: High/Low Thirst, Light Eater/Hearty Appetite, Thick/Thin Skinned, Slow/Fast Healer.
        -- IMPORTANT: if you pick any of these traits in character creation they will be permanent on your character, both negative and positive
        WeightSystem = true,
        -- How many levels in Strength + Fitness you need to have to gain Thick Skinned and Fast Healer (this is not only condition, once again check Google Sheets) Minimum=0 Maximum=20 Default=16
        WeightSystemSkill = 16,
        -- What your average mental (average from panic + unhappiness + fear + stress) health should be in last 31 survived days to obtain Thick Skinned and Fast Healer (this is not only condition, once again check Google Sheets) Minimum=0.00 Maximum=100.00 Default=60.00
        WeightSystemLowerMentalThreshold = 60.0,
        -- What your average mental (average from panic + unhappiness + fear + stress) health should be in last 31 survived days to obtain Light Eater and Low Thirst (this is not only condition, once again check Google Sheets) Minimum=0.00 Maximum=100.00 Default=80.00
        WeightSystemUpperMentalThreshold = 80.0,
        -- If this option is disabled, the moodle won't show up. For single-player, leave this on and change moodles you see with Mod Options. If it's a server setting, players won't be able to enable the moodle client-sided
        BloodlustMoodle = false,
        -- For how many hours the bloodlust moodle is visible after a nearby kill on a zombie Minimum=1 Maximum=480 Default=6
        BloodlustMoodleVisibilityHours = 6,
        -- If this option is disabled, the moodle won't show up. For single-player, leave this on and change moodles you see with Mod Options. If it's a server setting, players won't be able to enable the moodle client-sided
        SleepMoodle = false,
        -- Multiplies the effect of bloodlust by this value. By default, unhappiness, stress, and panic are each reduced by 4% for each kill. This multiplier is applied to those 4%. So setting this to 0.5 would make those stats reduced by 2% instead Minimum=0.00 Maximum=100.00 Default=1.00
        BloodlustMultiplier = 1.0,
        -- Minimum=0.00 Maximum=100.00 Default=0.50
        HoarderWeight = 0.5,
        -- Minimum=0.00 Maximum=100.00 Default=1.00
        HomichlophileMultiplier = 1.0,
        -- Minimum=0.00 Maximum=100.00 Default=1.00
        HomichlophobiaMultiplier = 1.0,
        -- Sets the maximum pain level your character can reach while benefiting from this perk Minimum=0.00 Maximum=100.00 Default=60.00
        PainToleranceThreshold = 60.0,
        -- Multiplies the effects of Unhappiness, Stress, and Boredom decreases Minimum=0.00 Maximum=100.00 Default=1.00
        PluviophileMultiplier = 1.0,
        -- Multiplies the effects of Unhappiness, Stress, and Boredom increases Minimum=0.00 Maximum=100.00 Default=1.00
        PluviophobiaMultiplier = 1.0,
        -- % chance to not increase the number of times an item was repaired after a repair Minimum=1 Maximum=100 Default=75
        RestorationExpertChance = 75,
        Asthmatic = true,
        -- The value on the counter you should reach to lose the asthmatic trait. Running or exercising in cold temperatures decreases the counter; the colder it is, the faster the decrease. If you're outside, it decreases even faster. If you are a smoker, it decreases even faster. Additionally, being a smoker slowly decreases the counter when you run, even if the weather is fine. Reaching the counter removes the trait. The counter slowly increases by itself as long as you're not running or sprinting and breathing air warmer than 0 degrees Celsius. On top of that, it increases based on your Fitness level and current endurance level. Being a smoker halves the increase rate. Having the asthmatic trait halves it again Minimum=0 Maximum=500000 Default=20000
        AsthmaticCounter = 20000,
        -- This allows you to gain a benefit by filling and maintaining a bloodlust meter. The bloodlust meter is soft-capped at 72 hours and can be filled by killing zombies. The closer the zombies are, the more quickly the meter will fill. When you're above half of the meter, every hour it will give you progress towards the bloodlust perk; when it's below, it'll remove progress. The bloodlust meter naturally decays by 1 every hour. Having bloodied clothes helps the process
        Bloodlust = true,
        -- How fast you fill your bloodlust meter Minimum=0.00 Maximum=100.00 Default=0.50
        BloodlustMeterFillMultiplier = 0.5,
        -- By how much you can overfill your Bloodlust Meter. This is a multiplier. 2 means you can fill your Bloodlust Meter to 200%, for example Minimum=1 Maximum=100 Default=2
        BloodlustMeterMaxCapMultiplier = 2,
        -- How much total bloodlust progress you need to get the trait. Be aware that you also lose bloodlust if this meter ever falls below 50%. So if you set it low, it's going to be easy to earn but also easy to lose the perk. Progress is capped at 2x the Bloodlust Progress value Minimum=1 Maximum=500000 Default=1000
        BloodlustProgress = 1000,
        CatEyes = true,
        -- This allows you to gain points by seeing and observing squares within a certain radius of your character. The number of points you earn is influenced by factors such as the time of day, the darkness of the square, and whether you and the square are inside or outside. The more squares you see and the darker they are, the more points you will earn. Having Eagle Eyed doubles the gain. Making a kill at night triggers extra execution of function responsible for gaining progress (so instead of getting progress 1 time / minute you can get progress 3 times per minute, for example) Minimum=0 Maximum=2500000 Default=250000
        CatEyesCounter = 250000,
        EagleEyed = true,
        -- At what distance must a zombie be to count this as a kill to Eagle-Eyed kill counter. For vanilla would recommend leaving at 20, for mods that add good firearms (Gunfighter + Brita for example), would recommend setting to 25 or so Minimum=0 Maximum=50 Default=20
        EagleEyedDistance = 20,
        -- Minimum=0 Maximum=500000 Default=200
        EagleEyedKills = 200,
        Herbalist = true,
        -- Specifies how many herbs you need to pick up (from foraging) to gain the trait Minimum=0 Maximum=500000 Default=250
        HerbalistHerbsPicked = 250,
        -- Determines how many herbs are removed from the counter each day. Dropping below half the counter removes the trait, requiring you to earn it again Minimum=0.00 Maximum=500000.00 Default=0.20
        HerbalistHerbsDecay = 0.2,
        Outdoorsman = true,
        -- This allows you to earn/lose by spending time outdoors and being exposed to various weather conditions. The harsher the weather, the faster you'll accumulate points towards gaining the trait. Conversely, staying indoors gradually reduces progress. You gain the trait when the counter reaches its specified threshold, and lose it when dropping below the opposite threshold. Being inside will slowly start to decrease the counter, with maximum decrease being reached after being indoors/in-car for 900 min. Killing while outside will also progress the counter based on weather. Minimum=0 Maximum=2500000 Default=500000
        OutdoorsmanCounter = 500000,
        -- Adjusts the rate at which you gain points in outdoorsman counter. For example, multiplier of 2.5 means you'd be gaining 250% of points'. Minimum=0.00 Maximum=100.00 Default=3.00
        OutdoorsmanCounterIncreaseMultiplier = 3.0,
        -- Adjusts the rate at which you lose points from the outdoorsman counter. For example, multiplier of 0.25 means you'd be losing 25% of points. Minimum=0.00 Maximum=100.00 Default=3.00
        OutdoorsmanCounterDecreaseMultiplier = 3.0,
        Smoker = false,
        -- Upon reaching this value on the counter, you'll get the Smoker trait. When dropping to the opposite of it, you'll lose it. Counter boundaries are -2x the counter to 2x the counter.
        -- 
        --  How it works: Every smoke you take increases your addiction counter. The longer breaks you take between smokes, the less the increase. Smoking while being panicked or stressed increases the counter much faster, based on the level of panic and stress. Not smoking slowly decays the counter. Being panicked or stressed slows the decay rate Minimum=0 Maximum=500000 Default=500
        SmokerCounter = 500,
        -- Determines how fast your addiction decays Minimum=0.00 Maximum=1000.00 Default=12.00
        SmokingAddictionDecay = 12.0,
        -- Determines how fast your addiction increases Minimum=0.00 Maximum=1000.00 Default=1.00
        SmokingAddictionMultiplier = 1.0,
        Mechanics = true,
        -- Minimum=0 Maximum=10 Default=4
        MechanicsSkill = 4,
        -- The percentage of car condition you have to repair to qualify for the perk. Works on every part of a car and is saved between all cars Minimum=0 Maximum=500000 Default=1000
        MechanicsRepairs = 1000,
        Fishing = true,
        -- Minimum=0 Maximum=10 Default=4
        FishingSkill = 4,
        AVClub = true,
        -- Minimum=0 Maximum=10 Default=4
        AVClubSkill = 4,
        Axeman = true,
        -- The number of trees you have to cut down to get the Axeman trait Minimum=0 Maximum=500000 Default=250
        AxemanTrees = 250,
        AxeThrower = true,
        -- Minimum=0 Maximum=10 Default=4
        AxeThrowerSkill = 4,
        -- Minimum=0 Maximum=500000 Default=200
        AxeThrowerKills = 200,
        BaseballPlayer = true,
        -- Minimum=0 Maximum=10 Default=4
        BaseballPlayerSkill = 4,
        -- Minimum=0 Maximum=500000 Default=200
        BaseballPlayerKills = 200,
        BodyworkEnthusiast = true,
        -- Metalworking + Mechanics Minimum=0 Maximum=20 Default=12
        BodyworkEnthusiastSkill = 12,
        -- The percentage of car condition you have to repair to qualify for the perk. Works on every part of a car and is saved between all cars Minimum=0 Maximum=500000 Default=6000
        BodyworkEnthusiastRepairs = 6000,
        Brawler = true,
        -- Axe + Long Blunt Minimum=0 Maximum=20 Default=12
        BrawlerSkill = 12,
        -- Axe + Long Blunt Minimum=0 Maximum=500000 Default=600
        BrawlerKills = 600,
        Burglar = true,
        -- Mechanics + Electrical + Nimble. Please note that you need to have at least 2 levels in both Mechanics and Electrical Minimum=4 Maximum=30 Default=7
        BurglarSkill = 7,
        Clumsy = true,
        -- Sneak + Lightfooted Minimum=0 Maximum=20 Default=12
        ClumsySkill = 12,
        Conspicuous = true,
        -- Minimum=0 Maximum=10 Default=4
        ConspicuousSkill = 4,
        Cook = true,
        -- Minimum=0 Maximum=10 Default=8
        CookSkill = 8,
        FirstAid = true,
        -- Minimum=0 Maximum=10 Default=4
        FirstAidSkill = 4,
        FurnitureAssembler = true,
        -- Minimum=0 Maximum=10 Default=4
        FurnitureAssemblerSkill = 4,
        Gardener = true,
        -- Minimum=0 Maximum=10 Default=4
        GardenerSkill = 4,
        Graceful = true,
        -- Nimble + Sneaking + Lightfooted Minimum=0 Maximum=30 Default=9
        GracefulSkill = 9,
        GunEnthusiast = true,
        -- Aiming + Reloading Minimum=0 Maximum=20 Default=12
        GunEnthusiastSkill = 12,
        -- Minimum=0 Maximum=500000 Default=600
        GunEnthusiastKills = 600,
        Gymnast = true,
        -- Lightfooted + Nimble Minimum=0 Maximum=20 Default=15
        GymnastSkill = 15,
        GymRat = true,
        -- Strength + Fitness Minimum=0 Maximum=20 Default=14
        GymRatSkill = 14,
        Handy = true,
        -- Maintenance + Carpentry Minimum=0 Maximum=20 Default=13
        HandySkill = 13,
        Hiker = true,
        -- Foraging + Trapping Minimum=0 Maximum=20 Default=10
        HikerSkill = 10,
        Hoarder = true,
        -- Minimum=0 Maximum=10 Default=8
        HoarderSkill = 8,
        HomeCook = true,
        -- Minimum=0 Maximum=10 Default=4
        HomeCookSkill = 4,
        Hunter = true,
        -- Sneaking + Aiming + Small Blade + Trapping Minimum=8 Maximum=40 Default=24
        HunterSkill = 24,
        -- Firearm + Small Blade Minimum=0 Maximum=500000 Default=200
        HunterKills = 200,
        Inconspicuous = true,
        -- Minimum=0 Maximum=10 Default=7
        InconspicuousSkill = 7,
        Kenshi = true,
        -- Minimum=0 Maximum=10 Default=5
        KenshiSkill = 5,
        -- Minimum=0 Maximum=500000 Default=250
        KenshiKills = 250,
        KnifeFighter = true,
        -- Minimum=0 Maximum=10 Default=4
        KnifeFighterSkill = 4,
        -- Minimum=0 Maximum=500000 Default=200
        KnifeFighterKills = 200,
        LightStep = true,
        -- Minimum=0 Maximum=10 Default=4
        LightStepSkill = 4,
        LowProfile = true,
        -- Minimum=0 Maximum=10 Default=4
        LowProfileSkill = 4,
        PainTolerance = true,
        -- Every 10 minutes your pain (0-100) is added to counter. Upon reaching counter you'll get Pain Tolerance trait Minimum=0 Maximum=500000 Default=30000
        PainToleranceCounter = 30000,
        RestorationExpert = true,
        -- Minimum=0 Maximum=10 Default=9
        RestorationExpertSkill = 9,
        Runner = true,
        -- Minimum=0 Maximum=10 Default=4
        RunnerSkill = 4,
        Sewer = true,
        -- Minimum=0 Maximum=10 Default=4
        SewerSkill = 4,
        -- Amount of unique clothing you need to rip to qualify for Sewer. If you are running with modded clothes, increase this respectively. AuthenticZ or Brita Armor Pack all add A LOT of clothing to rip, as an example. Minimum=0 Maximum=1000 Default=50
        SewerUniqueClothesRipped = 50,
        Sojutsu = true,
        -- Minimum=0 Maximum=10 Default=4
        SojutsuSkill = 4,
        -- Minimum=0 Maximum=500000 Default=200
        SojutsuKills = 200,
        StickFighter = true,
        -- Minimum=0 Maximum=10 Default=4
        StickFighterSkill = 4,
        -- Minimum=0 Maximum=500000 Default=200
        StickFighterKills = 200,
    },
    CF8KSweeper = {
        AllowTiles = true,
        -- You can list exact sprite names or the start of tilepacks. Separate them with ;
        SpriteWhitelist = "brokenglass_1_;trash_01_;d_trash_;street_decoration_01_26;street_decoration_01_27;damaged_objects_01_26;damaged_objects_01_27;damaged_objects_01_18;damaged_objects_01_19;damaged_objects_01_20;damaged_objects_01_21",
        AllowBlood = true,
        AllowGrime = true,
        AllowAshes = true,
        AllowItems = true,
        AllowCorpses = true,
    },
    Guns93 = {
        -- Does not currently remove weapons on zombies (WIP)
        Guns9322LRAmmoDistro = false,
        -- Does not currently remove weapons on zombies (WIP)
        Guns9325ACPAmmoDistro = false,
        -- Does not currently remove weapons on zombies (WIP)
        Guns93380ACPAmmoDistro = false,
        -- Does not currently remove weapons on zombies (WIP)
        Guns9338SPCAmmoDistro = false,
        -- Does not currently remove weapons on zombies (WIP)
        Guns939mmAmmoDistro = false,
        -- Does not currently remove weapons on zombies (WIP)
        Guns9340SWAmmoDistro = false,
        -- Does not currently remove weapons on zombies (WIP)
        Guns9345ACPAmmoDistro = false,
        -- Does not currently remove weapons on zombies (WIP)
        Guns9345ColtAmmoDistro = false,
        -- Does not currently remove weapons on zombies (WIP)
        Guns9310mmAmmoDistro = false,
        -- All .357 Magnum revolvers will spawn as .38 Special revolvers if .38 Special is not disabled.
        Guns93357MAGAmmoDistro = false,
        -- Does not currently remove weapons on zombies (WIP)
        Guns9344MAGAmmoDistro = false,
        -- Does not currently remove weapons on zombies (WIP)
        Guns93223556AmmoDistro = false,
        -- Does not currently remove weapons on zombies (WIP)
        Guns9330CARAmmoDistro = false,
        -- Does not currently remove weapons on zombies (WIP)
        Guns93308AmmoDistro = false,
        -- Does not currently remove weapons on zombies (WIP)
        Guns933006AmmoDistro = false,
        -- Does not currently remove weapons on zombies (WIP)
        Guns933030AmmoDistro = false,
        -- Does not currently remove weapons on zombies (WIP)
        Guns93762x39AmmoDistro = false,
        -- Does not currently remove weapons on zombies (WIP)
        Guns93MauserAmmoDistro = false,
        -- Will spawn all shotguns as slug guns if slugs are not disabled.
        Guns93ShotgunAmmoDistro = false,
        -- Does not currently remove weapons on zombies (WIP)
        Guns93SlugsAmmoDistro = false,
        -- Will disable Buckshot<>Slugs, .357Mag<>.38Spc ammo siwtching.
        Guns93AmmoSwitching = false,
        -- Disables the ability to fold or collapse stocks on firearms
        Guns93StockFold = false,
        -- Does not currently remove weapons on zombies (WIP)
        Guns93AutoDistro = false,
        -- Will remove the ability to convert semi-automatic firearms into automatics (Not Yet Implimented)
        Guns93DIYAutoDistro = false,
        -- Removes scope rails that can be install firearms
        Guns93RailsDistro = false,
        -- Will remove the ability to fix and use bayonets on firearms.
        Guns93BayoDistro = false,
        -- Does not currently remove silencers that spawn attached to weapons (WIP)
        Guns93SilencerDistro = false,
        -- Will remove the ability to tap barrel and bores for chokes, silencers, and muzzle devices
        Guns93BarrelThreading = false,
        -- Will remove the ability to craft silencers
        Guns93DIYSilencerDistro = false,
        -- Bayonets will not spawn on zombies
        Guns93ZedBayonet = false,
        -- Firearms will not spawn attached to zombies
        Guns93ZedGuns = false,
        -- Number that the spawn rate will be multipled by. Minimum=0.00 Maximum=10.00 Default=1.00
        Guns9322LRRarity = 1.0,
        -- Number that the spawn rate will be multipled by. Minimum=0.00 Maximum=10.00 Default=1.00
        Guns9325ACPRarity = 1.0,
        -- Number that the spawn rate will be multipled by. Minimum=0.00 Maximum=10.00 Default=1.00
        Guns93380ACPRarity = 1.0,
        -- Number that the spawn rate will be multipled by. Minimum=0.00 Maximum=10.00 Default=1.00
        Guns9338SPCRarity = 1.0,
        -- Number that the spawn rate will be multipled by. Minimum=0.00 Maximum=10.00 Default=1.00
        Guns939mmRarity = 1.0,
        -- Number that the spawn rate will be multipled by. Minimum=0.00 Maximum=10.00 Default=1.00
        Guns9340SWRarity = 1.0,
        -- Number that the spawn rate will be multipled by. Minimum=0.00 Maximum=10.00 Default=1.00
        Guns9345ACPRarity = 1.0,
        -- Number that the spawn rate will be multipled by. Minimum=0.00 Maximum=10.00 Default=1.00
        Guns9345ColtRarity = 1.0,
        -- Number that the spawn rate will be multipled by. Minimum=0.00 Maximum=10.00 Default=1.00
        Guns9310mmRarity = 1.0,
        -- Number that the spawn rate will be multipled by. Minimum=0.00 Maximum=10.00 Default=1.00
        Guns93357MAGRarity = 1.0,
        -- Number that the spawn rate will be multipled by. Minimum=0.00 Maximum=10.00 Default=1.00
        Guns9344MAGRarity = 1.0,
        -- Number that the spawn rate will be multipled by. Minimum=0.00 Maximum=10.00 Default=1.00
        Guns93223556Rarity = 1.0,
        -- Number that the spawn rate will be multipled by. Minimum=0.00 Maximum=10.00 Default=1.00
        Guns9330CARRarity = 1.0,
        -- Number that the spawn rate will be multipled by. Minimum=0.00 Maximum=10.00 Default=1.00
        Guns93308Rarity = 1.0,
        -- Number that the spawn rate will be multipled by. Minimum=0.00 Maximum=10.00 Default=1.00
        Guns933006Rarity = 1.0,
        -- Number that the spawn rate will be multipled by. Minimum=0.00 Maximum=10.00 Default=1.00
        Guns933030Rarity = 1.0,
        -- Number that the spawn rate will be multipled by. Minimum=0.00 Maximum=10.00 Default=1.00
        Guns93762x39Rarity = 1.0,
        -- Number that the spawn rate will be multipled by. Minimum=0.00 Maximum=10.00 Default=1.00
        Guns93MauserRarity = 1.0,
        -- Number that the spawn rate will be multipled by. Minimum=0.00 Maximum=10.00 Default=1.00
        Guns93ShotShellRarity = 1.0,
        -- Number that the spawn rate will be multipled by. Minimum=0.00 Maximum=10.00 Default=1.00
        Guns93PistolRarity = 1.0,
        -- Number that the spawn rate will be multipled by. Minimum=0.00 Maximum=10.00 Default=1.00
        Guns93RevolverRarity = 1.0,
        -- Number that the spawn rate will be multipled by. Minimum=0.00 Maximum=10.00 Default=1.00
        Guns93RifleRarity = 1.0,
        -- Number that the spawn rate will be multipled by. Minimum=0.00 Maximum=10.00 Default=1.00
        Guns93ShotgunRarity = 1.0,
        -- Number that the spawn rate will be multipled by. Minimum=0.00 Maximum=10.00 Default=1.00
        Guns93MagazineRarity = 1.0,
        -- Number that the spawn rate will be multipled by. Minimum=0.00 Maximum=10.00 Default=1.00
        Guns93UpgradeRarity = 1.0,
        -- Number that the spawn rate will be multipled by. Minimum=0.00 Maximum=10.00 Default=1.00
        Guns93SilencerRarity = 1.0,
        -- Number that the sound radius will be multipled by. Lower than 1 will reduce the Sound Radius. Higher than 1 increase it. Minimum=0.00 Maximum=2.00 Default=1.00
        Guns93SoundAdjust = 1.0,
        -- Number that Silencer Efficiency will be multipled by. Lower than 1 will reduce the Sound Radius. Higher than 1 increase it. Minimum=0.00 Maximum=1.25 Default=1.00
        Guns93SilencerEff = 1.0,
        -- Number that Recoil Delay will be multipled by. Lower than 1 will increase each guns rate of fire. Higher than 1 will will lower it.. Minimum=0.00 Maximum=2.00 Default=1.00
        Guns93RecoilAdjust = 1.0,
        -- The lowest possible recoil delay for handguns. Smaller number will allow guns to shoot faster. Higher will make them shoot slower. Minimum=0.00 Maximum=30.00 Default=15.00
        Guns93HandgunRecoilMin = 15.0,
        -- The lowest possible recoil delay for rifles, carbines, and shotguns. Smaller number will allow guns to shoot faster. Higher will make them shoot slower. Minimum=0.00 Maximum=30.00 Default=0.00
        Guns93LongGunRecoilMin = 0.0,
    },
    zReV2 = {
        -- The main zombie from the mod, a necessary key element to start your research journey!
        --  <INDENT:20>-Ordinary zombies range from 2000+;
        --  <INDENT:20>-For example, a zombie golfer (quite rare) has 2000 weight, and a park ranger 10000.
        --  Minimum=10 Maximum=30000 Default=200
        SpecZombieSpawnChance = 80,
        -- A first-level vaccine that resets infection to 5%.
        --  <INDENT:20>-The option affects the chance of a drop in a SPECIAL ZOMBIE.
        --  Minimum=0 Maximum=100 Default=10
        DefaultVaccineSpawnChance = 10,
        -- The option affects the chance of a drop in a SPECIAL ZOMBIE.
        --  Minimum=0 Maximum=100 Default=30
        ScalpelTweezersSpawnChance = 30,
        -- The option affects the chance of a drop in a SPECIAL ZOMBIES.
        --  Minimum=0 Maximum=100 Default=30
        TubeOrSyringeOrFlaskSpawnChance = 75,
        -- The option affects the chance of a drop in a SPECIAL ZOMBIES.
        --  Minimum=0 Maximum=100 Default=30
        TongsSpawnChance = 30,
        -- Determines the chance to get a normal sample when autopsy a zombie.
        --  Minimum=20 Maximum=60 Default=30
        chanceToNormal = 30,
        -- Determines the chance to get a rare sample when autopsy a zombie.
        --  Minimum=5 Maximum=30 Default=10
        chanceToRare = 10,
        -- Affects the number of books in the world.
        --  <INDENT:20>-Setting to 0 disables the spawn of books in the world;
        --  <INDENT:20>-Does not affect the drop of books in special zombies.
        --  Minimum=0.00 Maximum=2.00 Default=1.00
        BookInWorldSpawnChance = 1.0,
        -- Affects at which stage of infection resistant antibodies are activated.
        --  <INDENT:20>-This perk is acquired by administering a level 4 vaccine;
        --  <INDENT:20>-TERMINAL - with infection of more than 80%, health leaks, high probability of death;
        --  <INDENT:20>-PRETERMINAL - with infection of more than 60% (nausea, fever)(RECOMMENDED!);
        --  <INDENT:20>-AVERAGE - with infection of more than 40% (mild nausea);
        --  <INDENT:20>-INITIAL - with infection of more than 20% (without symptoms).
        --  Default=Pre-terminal
        -- 1 = Terminal
        -- 2 = Pre-terminal
        -- 3 = Medium
        AntibodyPower = 2,
        -- Affects how quickly resistant antibodies remove the zombie virus from the body after activation in the stage.
        --  <INDENT:20>-This perk is acquired by administering a level 4 vaccine;
        --  <INDENT:20>-If power = 6, then ~5% of infection is eliminated per hour;
        --  <INDENT:20>-If power = 12, then ~10% of infection;
        --  <INDENT:20>-If power = 24, then ~20% of infection is output per hour.
        --  Minimum=6 Maximum=24 Default=12
        AntibodyPower2 = 10,
        -- Selecting the type of result to improve (research) new vaccine levels.
        --  <INDENT:20>-PROGRESSIVE CHANCE - in case of failure, the next chance of success will increase (summed up);
        --  <INDENT:20>-STATIC CHANCE - a fixed percentage of success (30,20,14% from the second to the fourth);
        --  <INDENT:20>-FULL RESEARCH - there is a hidden scale of research progress (100 units, conditionally, each research fills the scale).
        --  Default=Full Research
        -- 1 = Progressive Chance
        -- 2 = Static Chance
        ResearchType = 1,
        -- Works only with the type of vaccine improvement study "PROGRESSIVE CHANCE" and "FULL RESEARCH"!
        --  <INDENT:20>-In case of an unsuccessful study, increases the result by a randomizer depending on this number (hereinafter referred to as X);
        --  <INDENT:26>-The formula works according to the type:
        --  Rand(X, X*2) for research up to 2 levels;
        --  <INDENT:26>Rand(X*0.75, X*1.5) for research up to 3 levels;
        --  <INDENT:26>Rand(X*0.5, X) for research up to Level 4!
        --  <INDENT:20>-Rounding occurs to a larger integer;
        --  <INDENT:20>-In simple terms: The randomizer is reduced for the research of a new vaccine by an average of ~ 30%.
        --  Minimum=4 Maximum=30 Default=10
        ResearchRand = 15,
        -- Minimum=6 Maximum=16 Default=8
        ResearchReduceHealth = 8,
        -- Affects at what level of health the character will notify about overcoming the critical health mark specified in this parameter!
        --  Minimum=15 Maximum=50 Default=42
        ResearchMinHealthNotification = 42,
    },
    TOC = {
        -- Minimum=1 Maximum=10 Default=1
        CicatrizationSpeed = 1,
        -- Minimum=0 Maximum=5 Default=1
        WoundDirtynessMultiplier = 1,
        -- Minimum=1 Maximum=3 Default=2
        SurgeonAbilityImportance = 2,
        EnableZombieAmputations = false,
        -- Minimum=0 Maximum=10 Default=4
        ZombieAmputationDamageThreshold = 4,
        -- Minimum=0 Maximum=100 Default=25
        ZombieAmputationDamageChance = 25,
    },
    CommonSense = {
        -- Toggles whether Players can pry open doors, windows, etc. using a Crowbar. 
        PryingMechanic = false,
        -- Toggles whether all doors can be pried open or not.
        -- By default, reinforced doors (Prison doors, metal grid doors, etc.) cannot be pried open up unless the Player has a Strength level equal to or higher than the Min. Reinforced Door Level. 
        PryAllDoors = false,
        -- Toggles whether to display a Color representing the Condition of various Vehicle Parts in the Vehicle Dashboard. 
        PartsHighlighter = true,
        -- Determines whether Players can accidentally smash Vehicle door windows when failing to pry them open.
        -- If enabled, this can happen at random (Based on the Window Shatter Chance setting). 
        ShatterVehicleWindows = true,
        -- Toggles friendly User Interface colors for those affected by color blindness. 
        ColorFilter = false,
        -- Determines the Minimum level of Strength at which Players can pry open reinforced doors (Prison doors, metal grid doors, etc.) Minimum=0 Maximum=10 Default=8
        ReinforcedDoorLevel = 8,
        -- Determines the chance of breaking the glass of a window when a Player fails an attempt to pry it open.  Minimum=0 Maximum=100 Default=20
        WindowShatterChance = 20,
        -- Determines the difficulty of prying open objects with a crowbar.
        -- A higher multiplier makes it more difficult to pry open objects successfully, while a lower multiplier makes it easier.
        -- 0 = Always Succeed.
        -- 1 = Default Difficulty.
        -- 5 = Highest Difficulty. Minimum=0.00 Maximum=5.00 Default=1.00
        PryingChanceMultiplier = 1.0,
        -- Determines the chance of getting wounded if a Player fails to open a can with an improvised tool.  Minimum=0 Maximum=100 Default=20
        CanWoundChance = 20,
        -- Multiplies the damage dealt to a Player when they fail to open a can with an improvised tool.
        -- Can be used to reduce or increase the damage to your liking. Minimum=0.00 Maximum=10.00 Default=1.00
        CanWoundIntensity = 1.0,
    },
    LSComfort = {
        -- Values below 1.0 decrease the rate, set it to 0 stop the need from increasing. Minimum=0.00 Maximum=3.00 Default=1.00
        ComfortNeedMultiplier = 1.0,
    },
    Text = {
        -- Enable/disable all mechanics related to Music (moodles, traits, interactions, ...).
        DividerMusicNew = true,
        -- Enable/disable all mechanics related to Dancing (moodles, traits, interactions, ...).
        DividerDancingNew = true,
        -- Enable/disable all mechanics related to Meditation (moodles, traits, interactions, ...).
        DividerMeditationNew = true,
        -- Enable/disable all mechanics related to Hygiene (moodles, traits, interactions, ...).
        DividerHygiene = true,
        -- This is only a line separator, checking it has no effect.
        DividerDebug = false,
    },
    Music = {
        -- Controls how strong music related activities are for the musician. Higher values increase their effectiveness on mood and xp gains. Default=Normal
        -- 1 = Low
        -- 2 = Normal
        -- 3 = High
        StrengthMultiplier = 2,
        -- Controls how strong the effects of listening to music are. Higher values increase it's effectiveness on mood. Default=Normal
        -- 1 = Low
        -- 2 = Normal
        -- 3 = High
        ListeningStrengthMultiplier = 2,
        -- Chance of learning a new song when practicing with an instrument. Music level 2 is required to start learning songs. Default=Normal
        -- 1 = Very Difficult
        -- 2 = Difficult
        -- 3 = Normal
        -- 4 = Easy
        LearningChance = 3,
    },
    Dancing = {
        -- Controls how powerful dancing is. Higher values increase it's effectiveness. Default=Normal
        -- 1 = Low
        -- 2 = Normal
        -- 3 = High
        StrengthMultiplier = 2,
    },
    Meditation = {
        -- Controls how powerful meditation is. Higher values increase it's effectiveness. Default=Normal
        -- 1 = Low
        -- 2 = Normal
        -- 3 = High
        StrengthMultiplier = 1,
        -- Controls the duration of all mindfulness states. Default=Normal
        -- 1 = Short
        -- 2 = Normal
        MindfulnessDuration = 1,
        -- How much healing occurs during the Perfect Mindfulness state.
        -- The amount varies depending on your character overall health and game-time settings. Minimum=0.00 Maximum=10.00 Default=2.00
        HealFactor = 0.01,
        -- Controls the effectiveness of the mindfulness states bonuses (stress, pain, panic, etc...). Default=Normal
        -- 1 = Weak
        -- 2 = Normal
        EffectMultiplier = 1,
    },
    LSMeditation = {
        -- Tick this box to disable levitation at higher levels.
        RemoveLevitation = true,
    },
    LSHygiene = {
        -- Values below 1.0 decrease the rate, set it to 0 stop the need from increasing. Minimum=0.00 Maximum=3.00 Default=1.00
        HygieneNeedMultiplier = 1.0,
        -- Values below 1.0 decrease the rate, set it to 0 stop the need from increasing. Minimum=0.00 Maximum=3.00 Default=1.00
        BladderNeedMultiplier = 0.0,
        -- How many survived days it takes for a new survivor to care about hygiene. Default=4-12 days
        -- 1 = 1-3 days
        -- 2 = 4-12 days
        -- 3 = 2-4 weeks
        HygieneNeedExpectationTime = 2,
        -- How many survived days it takes for a new survivor to care about their surroundings. Default=4-12 days
        -- 1 = 1-3 days
        -- 2 = 4-12 days
        -- 3 = 2-4 weeks
        CleaningExpectationTime = 3,
        -- Chance for an unskilled character to generate waste during a skill-based activity (e.g. food scraps from cooking with low cooking skill). Default=Normal
        -- 1 = Very Low
        -- 2 = Low
        -- 3 = Normal
        CleaningLitterChance = 3,
        -- Whether or not showering and bathing cleans body and facial makeup.
        CleansMakeup = true,
    },
    Debug = {
        -- Enabling this will cause other modded moodles to appear above lifestyle moodles.
        MoodlePriority = false,
        -- Enables manual expressions in the admin context menu
        Expressions = false,
        -- Enabling this will make animation names appear above some of the new animations
        DanceAnim = false,
    },
    RicksMLC_Concussion = {
        -- How long the effect lasts in seconds. Set to 0 to disable wall concussion. Minimum=0 Maximum=30 Default=10
        WallEffectTimeSeconds = 10,
        -- Turn on/off thoughts when concussed
        ThoughtsOn = true,
        -- How long the effect lasts in seconds. Set to 0 to disable sober trip concussion. Minimum=0 Maximum=30 Default=10
        TripEffectTimeSeconds = 10,
        -- How long the concussion effect lasts in seconds. Set to 0 to disable car crash concussion. Minimum=0 Maximum=30 Default=10
        CarCrashEffectTimeSeconds = 10,
        -- Concussion if the applied car crash damage is > this.  Note that even a small bump can register a tiny amount of damage, so setting to 0 will probably make you a safe driver due to -ve experience reinforcement. Minimum=1 Maximum=200 Default=12
        CarCrashDamageThreshold = 12,
        -- Probability to get a concussion when the damage is above the threshold. Minimum=0 Maximum=100 Default=40
        CarCrashConcussionChance = 40,
        -- Chance you will trip if you exit a vehicle while concussed - good luck getting out of this one. Minimum=0 Maximum=100 Default=30
        CarCrashTripChance = 30,
        -- Chance to be concussed from a trip fall Minimum=0 Maximum=100 Default=10
        TripChance = 10,
        -- Falling down while a firearm is equipped may fire the weapon.  It is possible to shoot yourself this way.  Lucky/Unlucky apply to this action.
        AccidentalDischarge = true,
        -- % chance for an equipped firearm to discharge on fall Minimum=0 Maximum=100 Default=80
        AccidentalDischargeChance = 60,
        -- % base chance to shoot yourself Minimum=0 Maximum=100 Default=60
        ShootSelfBaseChance = 25,
        -- % chance to shoot yourself if you are unlucky Minimum=0 Maximum=100 Default=80
        ShootSelfUnluckyChance = 80,
        -- % chance to shoot yourself if you are lucky Minimum=0 Maximum=100 Default=5
        ShootSelfLuckyChance = 5,
        -- % base chance to shoot a zombie if you don't shoot yourself first Minimum=0 Maximum=100 Default=20
        ShootZombieChance = 20,
        -- % chance to shoot a zombie if you are unlucky and don't shoot yourself first Minimum=0 Maximum=100 Default=10
        ShootZombieUnluckyChance = 10,
        -- % chance to shoot a zombie if you are lucky and don't shoot yourself first Minimum=0 Maximum=100 Default=85
        ShootZombieLuckyChance = 85,
        -- Deafness as well as shot and disorientated?  This is getting really hardcore now...  Set to 0 to disable. Minimum=0 Maximum=100 Default=45
        AccidentalDischargeDeafnessChance = 45,
    },
    RicksMLC_Drunk = {
        -- Turn on/off stumbling and/or falling due to drunk moodle level
        EffectOn = true,
        -- Turn on/off thoughts when drunk
        ThoughtsOn = true,
        -- Each in-game minute (about 1 seconds real time) has this base chance to stagger (n x drunk level) Minimum=0 Maximum=100 Default=20
        BaseProbStagger = 20,
        -- Base duration of the stagger in seconds (n x drunk level) Minimum=0.10 Maximum=2.00 Default=0.30
        BaseStaggerTime = 0.3,
        -- Number of in-game minutes (about 1 second real time) to wait to check for stagger after the last successful one. Minimum=1 Maximum=10 Default=2
        StaggerCooldown = 2,
        -- Each in-game minute (about 1 seconds real time) has this base chance to trip (n x drunk level) Minimum=0 Maximum=100 Default=20
        BaseProbTrip = 20,
    },
    RicksMLC_EarDamage = {
        -- Turn this on to experience ear damage using firearms (whee)
        Enable = true,
        -- Sounds above this volume trigger deaf check Minimum=1 Maximum=100 Default=50
        VolumeThreshold = 50,
        -- Number of seconds the sound volume is accumulated for deaf check Minimum=1 Maximum=10 Default=3
        TimespanThresholdSeconds = 3,
        -- Deafness is triggered if the sum of the sounds exceeds this amount over the Sound Period. Note the sound volume is amplified by echo inside buildings. Minimum=100 Maximum=20000 Default=2900
        DeafTriggerVolume = 2900,
        -- How long the temporary deafness lasts in real seconds Minimum=0 Maximum=60 Default=10
        DeafTime = 10,
    },
    ExpandedHeli = {
        -- This is what day into the game events occur. You will need to factor in "months into the apocalypse" settings. Minimum=0 Maximum=999 Default=0
        StartDay = 0,
        -- How many days the scheduler run from the start day.
        -- The scheduler will adjust event progression to fit this duration. Minimum=1 Maximum=999 Default=90
        SchedulerDuration = 90,
        -- Toggle this on so that the scheduler will spawn events passed the duration limit. Events will still progress through stages according to the duration but events will never stop being scheduled.
        ContinueScheduling = true,
        -- When "Continue Scheduling Forever" is toggle on, this toggled on makes the scheduler only use late-game events.
        ContinueSchedulingLateGameOnly = true,
        -- Whether weather will prevent events, or cause their crash.
        WeatherImpactsEvents = true,
        -- This is multiplied against crash chance, 0 will prevent crashes all together. Minimum=0.00 Maximum=1000.00 Default=1.00
        CrashChanceMulti = 1.0,
        -- Choose true if you want an air raid event to signal a shift from less challenging early-game events to more hostile late-game events.
        AirRaidSirenEvent = true,
        -- How frequent jet events occur.
        -- Jets fly by players causing horde movement. Default=Uncommon
        -- 1 = Never
        -- 2 = Rare
        -- 3 = Uncommon
        -- 4 = Common
        -- 5 = Frequent
        Frequency_jet = 3,
        -- How frequent Police events occur.
        -- The police will take matters into their own hands and escort citizens around while firing on zombies. Default=Uncommon
        -- 1 = Never
        -- 2 = Rare
        -- 3 = Uncommon
        -- 4 = Common
        -- 5 = Frequent
        Frequency_police = 3,
        -- How frequent news events occur.
        -- News choppers will hone in on any citizen they find and follow them around for a short time. Default=Uncommon
        -- 1 = Never
        -- 2 = Rare
        -- 3 = Uncommon
        -- 4 = Common
        -- 5 = Frequent
        Frequency_news_chopper = 3,
        -- How frequent military events occur.
        -- The military will progress through stages: warn citizens, purge the undead, then ultimately purge anything that moves. Default=Uncommon
        -- 1 = Never
        -- 2 = Rare
        -- 3 = Uncommon
        -- 4 = Common
        -- 5 = Frequent
        Frequency_military = 3,
        -- How frequent FEMA aid drop events occur.
        -- FEMA will conduct aid drops early on in the apocalypse. Default=Uncommon
        -- 1 = Never
        -- 2 = Rare
        -- 3 = Uncommon
        -- 4 = Common
        -- 5 = Frequent
        Frequency_FEMA_drop = 3,
        -- How frequent samaritan events occur.
        -- Samaritans will drop off supplies to help survivors. Default=Uncommon
        -- 1 = Never
        -- 2 = Rare
        -- 3 = Uncommon
        -- 4 = Common
        -- 5 = Frequent
        Frequency_samaritan_drop = 3,
        -- How frequent survivor events occur.
        -- Survivors will only flyby on scouting missions causing horde movement. Default=Uncommon
        -- 1 = Never
        -- 2 = Rare
        -- 3 = Uncommon
        -- 4 = Common
        -- 5 = Frequent
        Frequency_survivor_heli = 3,
        -- How frequent raider events occur.
        -- Raiders will hone in on survivors to torment them for some entertainment. Default=Uncommon
        -- 1 = Never
        -- 2 = Rare
        -- 3 = Uncommon
        -- 4 = Common
        -- 5 = Frequent
        Frequency_raiders = 2,
    },
    FancyHandwork = {
        -- Player Firearm Level to change to Tactical Aiming animation. <LINE> Set to 0 to always use this.  Set to 11 to never. Minimum=0 Maximum=11 Default=3
        ExperiencedAim = 3,
        -- When the character is not moving, they will turn to face an object they are interacting with after this many seconds. <LINE> Requires Turn Delay to be enabled. Minimum=0.01 Maximum=60.00 Default=1.00
        TurnDelaySec = 1.0,
        -- Controls when your character is forced to turn to objects when performing the World Interaction Default=Do forced turn after turn delay
        -- 1 = Never do forced turn
        -- 2 = Do forced turn after turn delay
        DisableTurn = 2,
        -- Choose how often characters play the Rear Animations instead of Turning. <LINE> Notes: Character will still turn to objects that do not have a rear animation unless forced turn is disabled. <LINE> Turn delay or disabled turns must be selected to show rear animations. 'Always do forced turn' prevents rear animations. Default=Do rear animations until turn delay
        -- 1 = Never do rear animations
        -- 2 = Do rear animations until turn delay
        TurnBehavior = 2,
        -- Hides the progress bar when a character is opening or closing a door, and when entering or exiting a vehicle.
        HideDoorProgressBar = false,
        -- Hides the progress bar when a character is walking to a location to interact with a vehicle.
        HideVehicleWalkProgressBar = false,
    },
    BrutalHandwork = {
        -- When a player is dual-wielding melee weapons, automatically alternate between left and right attacks. Disable to require the Modifier to be pressed for an offhand attack.
        DualWieldMelee = false,
        -- Even when a player is unarmed, they will be able to attack. By default, must be aiming and holding the Modifier key to punch.
        EnableUnarmed = true,
        -- When a player is unarmed, always raise their fists when aiming for unarmed attacks.  Disable to require the Modifier to be held when aiming.
        AlwaysUnarmed = false,
    },
    TrueCrawl = {
        -- Use this option only if you're hosting an Local or Dedicated server. (To avoid issues). [Default is False]. 
        StealhModeServer = false,
        -- Toggles the Stealth Mode ON or OFF. If OFF, only the vanilla Sneaking system will be used. [Default is True].
        StealhModeEnable = true,
        -- Toggles the Moodle Stealth Indicator. (Works ONLY if Stealth Mode is ON!) [Default is True]. 
        MoodleEnable = false,
        -- Toggles the ability to Crawl under Vehicles. (YOU MUST BE CRAWLING!) [Default is True, Default Key is Shift]. 
        CrawlUnderVehiclesEnable = true,
        -- Toggles the Realistic Endurance mode. This mode improves the game immersion by limiting how much you can crawl. [Default is True]. 
        RealisticEndurance = true,
        -- Auto disable the Crawling Pose when spotted by zombies. [Default is False]. 
        CancelCrawlWhenSpotted = false,
        -- This value controls the zombie sight radius when player is crawling. It goes from 1(Extremely Small) to 20(Extremely Far). Default is 5 (Medium Radius). My recommendation is to keep between 5 - 10 to have a more immersive gameplay. Minimum=1 Maximum=20 Default=5
        ZombieRadius = 5,
    },
    ForScience = {
        -- Allow training First Aid up to level 4 by practicing applying bandages
        EnableBandageTraining = false,
        EnableDisection = false,
        -- Allow training Electrical by tinkering with devices
        EnableTinkering = true,
        -- Allow performing a maintenance action on weapons that will clean blood off and rarely restore condition
        EnableMaintaining = false,
    },
    SkillRecoveryJournal = {
        -- The amount of experienced recovered from reading bound journals.
        -- This value is defaulted to if other options are set to -1. Minimum=1 Maximum=100 Default=100
        RecoveryPercentage = 75,
        -- A multiplier on the speed of transcribing journals. Minimum=0.00 Maximum=1000.00 Default=1.00
        TranscribeSpeed = 0.8,
        -- A multiplier on the speed of reading bound journals. Minimum=0.00 Maximum=1000.00 Default=1.00
        ReadTimeSpeed = 1.2,
        RecoverProfessionAndTraitsBonuses = false,
        -- Toggling this on will allow people to transcribe XP earned from watching TV/VHS. Note: This means players can carry over watched XP between characters cumulatively.
        TranscribeTVXP = false,
        -- Recovery percentage for passive skills.
        -- Set this to -1 to use the General Skill Recovery Percentage. Minimum=-1 Maximum=100 Default=0
        RecoverPassiveSkills = 0,
        -- Recovery percentage for combat skills.
        -- Set this to -1 to use the General Skill Recovery Percentage. Minimum=-1 Maximum=100 Default=-1
        RecoverCombatSkills = -1,
        -- Recovery percentage for firearm skills.
        -- Set this to -1 to use the General Skill Recovery Percentage. Minimum=-1 Maximum=100 Default=-1
        RecoverFirearmSkills = -1,
        -- Recovery percentage for crafting skills.
        -- Set this to -1 to use the General Skill Recovery Percentage. Minimum=-1 Maximum=100 Default=-1
        RecoverCraftingSkills = -1,
        -- Recovery percentage for survivalist skills.
        -- Set this to -1 to use the General Skill Recovery Percentage. Minimum=-1 Maximum=100 Default=-1
        RecoverSurvivalistSkills = -1,
        -- Recovery percentage for agility skills.
        -- Set this to -1 to use the General Skill Recovery Percentage. Minimum=-1 Maximum=100 Default=-1
        RecoverAgilitySkills = 0,
        -- Toggle off to prevent journals from recovering/transcribing recipes.
        RecoverRecipes = true,
        -- Normally you can reread the journal as many times as you like - with this toggled on each individual XP point can only be recovered once. You can still add onto the journal, but each point can only be recovered once on each journal. Note: the tooltip for the journal will now display a fraction for unused points.
        RecoveryJournalUsed = false,
        Craftable = true,
        -- Minimum=0 Maximum=100 Default=0
        KillsTrack = 0,
    },
    CanRepairDoors = {
        -- Minimum=0 Maximum=10 Default=1
        RepairSkillNeeded = 1,
        -- Minimum=0 Maximum=10 Default=3
        ReinforceSkillNeeded = 4,
        -- Minimum=1 Maximum=1000 Default=6
        multiplyerMaxReinforcement = 6,
    },
    FWOFitness = {
        -- Take the inital perk bonus into account (75% 100% 125%)
        InitialPerkBonus = true,
        -- Get a bonus for the current excercise depending on the regularity
        currentExerciseRegularityBonus = true,
        -- The 0 point for the linear calculation Minimum=0 Maximum=100 Default=25
        currentExerciseOffset = 25,
        -- The steepness of the linear angle (higher number = higher multiplier)(and higher negatives with offset) Minimum=0.01 Maximum=100.00 Default=5.00
        currentExerciseRate = 5.0,
        -- Get a bonus depending on the average of all your excercises regularity Minimum=0.00 Maximum=100.00 Default=6.00
        AverageExerciseRegularityBonus = 6.0,
        -- How much multiplier you get per perk level Minimum=0.00 Maximum=100.00 Default=0.30
        LevelBonus = 0.3,
        -- Get an exp buff when you space out excercises (about 8hr or when muscle soreness sets in) independent for fitness and strength
        SpaceOutExercise = true,
        -- Minimum=0.00 Maximum=100.00 Default=0.90
        SpaceOutExerciseNegative = 0.9,
        -- Get an exp debuff when you have muscle soreness, buff when 'rested' (no muscle soreness)
        RestedBonus = true,
        -- Minimum=0.00 Maximum=10.00 Default=0.90
        RestedBonusNegative = 0.9,
        -- Global exp multiplier (makes you earn experience faster or slower, small increments recommanded) Minimum=0.01 Maximum=10.00 Default=1.00
        XPMultiplier = 1.0,
        -- Determens how much multiplier you get outside of doing exercises. EG. fighting,sprinting,...  (0 = OFF No passive exp multiplier) Minimum=0.00 Maximum=10.00 Default=1.00
        PassiveMultiplier = 1.0,
        -- adjust Boredom reduction gained (0 = off) Minimum=0.00 Maximum=10.00 Default=1.00
        BoredomMultiplier = 1.0,
        -- adjust Unhappyness reduction gained (0 = off) Minimum=0.00 Maximum=10.00 Default=1.00
        UnhappynessMultiplier = 1.0,
        DropBags = false,
        KeepBagsOn = false,
    },
    FWOWorkingTreadmill = {
        -- Minimum=0.00 Maximum=100.00 Default=1.00
        StrengthXPMultiply = 1.0,
        -- Minimum=0.00 Maximum=100.00 Default=1.00
        SprintingXPMultiply = 1.0,
        TreadmillDropBags = false,
        BenchpressDropBags = false,
        BenchTreadKeepBagsOn = false,
    },
    FishingPlus = {
        -- The higher the setting, the higher the XP gain per fish and the bigger the increased bonus XP by size. Default=Medium
        -- 1 = Low (Vanilla-near)
        -- 2 = Medium
        XpSetting = 2,
        -- Gained XP values will be multiplied by this value.
        XpMultiplier = "1.0",
        -- Increase to catch fish with higher nutrition values. (Vanilla 2.2)
        FishNutritionFactor = "2.2",
        -- Set what trash loot should spawn. Fishing+ uses a weighted loot table whereas vanilla spawns one of two items randomly. Default=Fishing+ Trash Loot Generation
        -- 1 = Fishing+ Trash Loot Generation
        TrashItemConfig = 1,
        -- Decreases the Fish Abundance whenever catching anything (Vanilla) or only when catching fish. Default=On any catch (Vanilla)
        -- 1 = On any catch (Vanilla)
        DecreaseAbundance = 1,
        -- Include the size of the fish in its displayed name. NOTE: This feature will use english names for all fish caught by this mod.
        RenameFish = true,
    },
    ISA = {
        -- How often Battery Bank will charge Default=Every Ten Minutes
        -- 1 = Every Ten Minutes
        ChargeFreq = 1,
        -- Regular Generator calculation has less performance impact Default=Regular Generator
        -- 1 = "ISA"
        DrainCalc = 2,
        -- Solar panel power efficiency
        -- 12% is realistic for 1993
        -- 25% is modern solar
        -- default is unrealistic Minimum=1 Maximum=100 Default=25
        solarPanelEfficiency = 25,
        -- Multiplier for the average degrade of batteries. Decreasing this will dramatically increase battery life. Minimum=0 Maximum=1000 Default=100
        batteryDegradeChance = 100,
        -- Crafted DIY battery capacity multiplier. Minimum=1 Maximum=10000 Default=100
        DIYBatteryMultiplier = 100,
        -- How likely pre-placed solar panels and crates are to spawn at a given spawn location.
        -- Requires external API to work. Minimum=0 Maximum=100 Default=25
        solarPanelWorldSpawns = 25,
        -- Rarity of Battery Bank spawning on the map. Default=Rare
        -- 1 = None
        -- 2 = Very Rare
        -- 3 = Rare
        BatteryBankSpawn = 3,
        -- Choose mode for Stash Houses.
        -- Change only on new game. Default=Don't add
        -- 1 = Don't add
        -- 2 = Add map items
        -- 3 = Add map items and random initial
        StashMode = 1,
        -- Solar panel spawns in random containers and pre-placed crates multiplier Minimum=0.00 Maximum=100.00 Default=1.00
        LRMSolarPanels = 1.0,
        -- Batteries spawns in random containers and pre-placed crates multiplier Minimum=0.00 Maximum=100.00 Default=1.00
        LRMBatteries = 1.0,
        -- Magazine and inverter spawns in random containers and pre-placed crates multiplier Minimum=0.00 Maximum=100.00 Default=1.00
        LRMMisc = 1.0,
        -- Base number of in-game minutes it takes to connect one panel Minimum=1 Maximum=1000 Default=120
        ConnectPanelMin = 30,
        -- Allows to craft solar panels and inverters
        enableExpandedRecipes = true,
    },
    GunStockAttackOption = {
        -- Minimum=0.00 Maximum=200.00 Default=5.00
        Damage = 5.0,
        -- Minimum=0.00 Maximum=100.00 Default=0.01
        EnduranceLost = 0.04,
        -- Minimum=0 Maximum=100 Default=1
        WeaponConditionLost = 2,
        -- Minimum=0.00 Maximum=10.00 Default=1.34
        RifleSpeed = 1.34,
        -- Minimum=0.00 Maximum=10.00 Default=1.24
        PistolSpeed = 1.24,
    },
    FunctionalAppliances = {
        -- How often filled beer kegs spawn in bars. Default=Normal
        -- 1 = Extremely Rare
        -- 2 = Rare
        -- 3 = Normal
        -- 4 = Common
        -- 5 = Abundant
        BeerKegsChance = 2,
        -- How full are the beer kegs that are spawned. Default=Medium
        -- 1 = Very Low
        -- 2 = Low
        -- 3 = Medium
        -- 4 = Nearly Full
        -- 5 = Always Full
        BeerKegsFilledAmount = 6,
        -- How often filled syrups and CO2 tanks spawn in fountain locations. Default=Normal
        -- 1 = Extremely Rare
        -- 2 = Rare
        -- 3 = Normal
        -- 4 = Common
        -- 5 = Abundant
        SyrupsChance = 3,
        -- How full are the soda syrups and CO2 tanks that are spawned. Default=Medium
        -- 1 = Very Low
        -- 2 = Low
        -- 3 = Medium
        -- 4 = Nearly Full
        -- 5 = Always Full
        SyrupsFilledAmount = 6,
        -- How often popcorn and other Functional Appliances items spawn in the theatre counters. Default=Normal
        -- 1 = Extremely Rare
        -- 2 = Rare
        -- 3 = Normal
        -- 4 = Common
        -- 5 = Abundant
        FATheatreChance = 3,
        -- How often Functional Appliances fresh food items spawn in the theatre counters. Default=Normal
        -- 1 = Extremely Rare
        -- 2 = Rare
        -- 3 = Normal
        -- 4 = Common
        -- 5 = Abundant
        FAFreshTheatreChance = 3,
        -- How often Functional Appliances Deep Fryers spawn with oil in the vats. Default=Normal
        -- 1 = Extremely Rare
        -- 2 = Rare
        -- 3 = Normal
        -- 4 = Common
        -- 5 = Abundant
        FADeepFryerOil = 3,
        -- Disabling this will remove the possibility of Functional Appliances items spawning on zombies.
        FAZombieItemsSpawn = true,
        -- Disabling this will remove the possibility of zombies being attracted to ringing Functional Appliances Pay Phones.
        FAPayPhonesAttractZombies = true,
        -- How often non-perishable food from the Sapph's Cooking Mod spawns in the theatre counters. Default=Normal
        -- 1 = Extremely Rare
        -- 2 = Rare
        -- 3 = Normal
        -- 4 = Common
        -- 5 = Abundant
        FASapphsCookingTheatreChance = 3,
        -- How often fresh food from the Sapph's Cooking Mod spawns in the theatre counters. Default=Normal
        -- 1 = Extremely Rare
        -- 2 = Rare
        -- 3 = Normal
        -- 4 = Common
        -- 5 = Abundant
        FASapphsCookingFreshTheatreChance = 3,
        -- How often candies from the Corner Store Candies and Sodas Mod spawn in the theatre counters. Default=Normal
        -- 1 = Extremely Rare
        -- 2 = Rare
        -- 3 = Normal
        -- 4 = Common
        -- 5 = Abundant
        FACCSTheatreChance = 3,
        -- Enabling this will make wall clocks read 0-24 Hours instead of 0-12 Hours.
        FA24HRWallClocks = false,
        -- Disabling this will remove the possibility for silos to be converted into generators.
        FAEnableSiloGenerators = true,
        -- How often generator magazines spawn in silo generators. Default=Normal
        -- 1 = Extremely Rare
        -- 2 = Rare
        -- 3 = Normal
        -- 4 = Common
        -- 5 = Abundant
        FAGeneratorMagazineSpawnChance = 3,
        -- The chances that a silo generator will be set to auto power on by default. Default=Normal
        -- 1 = Extremely Rare
        -- 2 = Rare
        -- 3 = Normal
        -- 4 = Common
        -- 5 = Always
        FAAutoPowerOnChance = 3,
        -- How full are the silo generator fuel tanks when they spawn. Default=Completely Random
        -- 1 = Low
        -- 2 = Medium
        -- 3 = High
        -- 4 = Full
        -- 5 = Completely Random
        FAFuelTankFilledAmount = 5,
        -- How much condition the silo generators start with when they spawn. Default=Completely Random
        -- 1 = Low
        -- 2 = Medium
        -- 3 = High
        -- 4 = Full
        -- 5 = Completely Random
        FAConditionAmount = 5,
    },
    AmmSUIButton = {
        -- Minimum=4 Maximum=20 Default=8
        columns = 8,
        all = true,
        marksSymbols = true,
        weaponsSymbols = true,
        toolsSymbols = true,
        carsSymbols = true,
        itemsSymbols = true,
        furnituresSymbols = true,
        foodsSymbols = true,
        medSymbols = true,
        craftSymbols = true,
    },
    MoreBrews = {
        -- Establishes the base amount of More Brews loot in distribution Default=Low
        -- 1 = Low
        -- 2 = Normal
        -- 3 = High
        -- 4 = Very High
        Loot = 1,
        -- Amount of total beer obtained at the end of the process, Average is the normal amount and about a 20% difference between each option Default=Average
        -- 1 = A Lot Less
        -- 2 = A Little Less
        -- 3 = Average
        -- 4 = A Bit More
        TotalAmount = 3,
        -- Brewing Kits will spawn when checked
        KitSpawnOption = true,
        -- Kegs will spawn when checked
        KegSpawnOption = true,
        -- Default is off but if turned on you will find all the various hops through foraging in some zones on the map during appropriate months
        ForageHops = false,
        -- Default of 5 gives a slight rarity to spawn, 1 would be very rare and 20 would be very common Minimum=1 Maximum=20 Default=5
        ForageHopsRate = 5,
        -- Hops will spawn in other locations outside of Kits when checked
        HopsOption = false,
        -- General Brewing Supplies will spawn when checked
        SuppliesSpawnOption = true,
        -- Recipe Magazines will spawn when checked
        MagazineSpawnOption = true,
        -- Brewing Book will spawn when checked
        BookSpawnOption = true,
        -- Full Beer Cans and Bottle will spawn when checked
        BeerSpawnOption = true,
        -- Defines the multiplier to spawn rate of Brewing Kits found in the world Minimum=1 Maximum=10 Default=2
        BrewingKits = 2,
        -- Defines the multiplier to spawn rate of Empty Kegs found in the world Minimum=1 Maximum=10 Default=2
        Kegs = 2,
        -- Defines the multiplier to spawn rate of Hops found in the world Minimum=1 Maximum=10 Default=2
        Hops = 2,
        -- Defines the multiplier to spawn rate of Recipe Magazines found in the world Minimum=1 Maximum=10 Default=2
        Recipes = 2,
        -- Defines the multiplier to spawn rate of Skill Books found in the world Minimum=1 Maximum=10 Default=2
        Books = 2,
        -- Defines the multiplier to spawn rate of Malt, Bottle Caps, and filling tools found in the world Minimum=1 Maximum=10 Default=2
        FillingSupplies = 2,
        -- Defines the multiplier to spawn rate of Beer Cans found in the world Minimum=1 Maximum=10 Default=2
        Cans = 2,
        -- Defines the multiplier to spawn rate of Beer Bottles found in the world Minimum=1 Maximum=10 Default=2
        Bottles = 2,
        -- A small bonus is already given to crafting bottle caps / Beer Bottles & Cans / beer containers based on brewing level. This will +1-5 on top of that bonus Minimum=0 Maximum=5 Default=0
        BrewingBonus = 0,
        -- Default 10 is equal to fermenting timer, lower is faster as 1 = 10% of time required where as 20 = 200% of time required Minimum=1 Maximum=20 Default=10
        FermentChange = 10,
        -- Default 10 is equal to rotting timer, lower is faster as 1 = 10% of time required where as 20 = 200% of time required Minimum=1 Maximum=20 Default=10
        RottenChange = 10,
        -- Change calorie totals by increments of 10%. Default of 10 = 100%  and go as low as 1 = 10% or as high as 20 = 200% Minimum=1 Maximum=20 Default=10
        CalorieChange = 10,
        -- Will add a fresh and rotten timer to More Brews Beers
        Expired = false,
        -- Default freshness is 3 weeks and rotten is 1.5 months. This can be changed in increments of 10%, 1 = 10% (rotten in days) or 20 = 200% (doubling) Minimum=1 Maximum=20 Default=10
        ExpireChange = 10,
    },
    MoreBrewsWineMeUp = {
        -- Establishes the base amount of Wine Me Up loot in distribution Default=Low
        -- 1 = Low
        -- 2 = Normal
        -- 3 = High
        -- 4 = Very High
        Loot = 1,
        -- Amount of total wine obtained at the end of the process, Average is the normal amount and about a 20% difference between each option Default=Average
        -- 1 = A Lot Less
        -- 2 = A Little Less
        -- 3 = Average
        -- 4 = A Bit More
        TotalAmount = 3,
        -- Wine Making Kits will spawn when checked
        WineKitSpawnOption = true,
        -- General Wine Making Supplies will spawn when checked
        SuppliesSpawnOption = true,
        -- Recipe Magazines will spawn when checked
        MagazinesSpawnOption = true,
        -- Brewing Book will spawn when checked
        BookSpawnOption = true,
        -- Full Wine Box and Bottle will spawn when checked
        WineSpawnOption = true,
        -- Defines the multiplier to spawn rate of Wine Making Kits found in the world Minimum=1 Maximum=10 Default=2
        WineMakingKits = 2,
        -- Defines the multiplier to spawn rate of Wine Making Supplies found in the world Minimum=1 Maximum=10 Default=2
        Supplies = 2,
        -- Defines the multiplier to spawn rate of Recipe Magazines found in the world Minimum=1 Maximum=10 Default=2
        Recipes = 2,
        -- Defines the multiplier to spawn rate of Skill Books found in the world Minimum=1 Maximum=10 Default=2
        Books = 2,
        -- Defines the multiplier to spawn rate of Full Wine found in the world Minimum=1 Maximum=10 Default=2
        Wine = 2,
        -- A small bonus is already given to crafting Corks / Wine Bottles/ Wine Boxes based on brewing level. This will +1-5 on top of that bonus Minimum=0 Maximum=5 Default=0
        WineMakingBonus = 0,
        -- Default 10 is equal to fermenting timer, lower is faster as 1 = 10% of time required where as 20 = 200% of time required Minimum=1 Maximum=20 Default=10
        FermentChange = 10,
        -- Change calorie totals by increments of 10%. Default of 10 = 100%  and go as low as 1 = 10% or as high as 20 = 200% Minimum=1 Maximum=20 Default=10
        CalorieChange = 10,
        -- Will add a fresh and rotten timer to More Brews Wines
        Expired = false,
        -- Default freshness is 3 weeks and rotten is 1.5 months. This can be changed in increments of 10%, 1 = 10% (rotten in days) or 20 = 200% (doubling) Minimum=1 Maximum=20 Default=10
        ExpireChange = 10,
    },
    newcontainersnc = {
        -- Spawn multiplier for the .30 cal ammo can Minimum=0.00 Maximum=100.00 Default=1.00
        ammocan30 = 0.0,
        -- Spawn multiplier for the .50 cal ammo can Minimum=0.00 Maximum=100.00 Default=1.00
        ammocan50 = 0.0,
        -- Spawn multiplier for the basket Minimum=0.00 Maximum=100.00 Default=1.00
        basket = 1.0,
        -- Spawn multiplier for the foraging basket Minimum=0.00 Maximum=100.00 Default=1.00
        basket_forage = 1.0,
        -- Spawn multiplier for the beverage jugs Minimum=0.00 Maximum=100.00 Default=1.00
        beveragejug = 1.0,
        -- Spawn multiplier for the bread box Minimum=0.00 Maximum=100.00 Default=1.00
        breadbox = 1.0,
        -- Spawn multiplier for the canteen Minimum=0.00 Maximum=100.00 Default=1.00
        canteen = 1.0,
        -- Spawn multiplier for the military canteen Minimum=0.00 Maximum=100.00 Default=1.00
        canteenmilitary = 1.0,
        -- Spawn multiplier for the canvas tote Minimum=0.00 Maximum=100.00 Default=1.00
        canvastote = 1.0,
        -- Spawn multiplier for the large cardboard box Minimum=0.00 Maximum=100.00 Default=1.00
        cardboard_large = 1.0,
        -- Spawn multiplier for the medium cardboard box Minimum=0.00 Maximum=100.00 Default=1.00
        cardboard_medium = 1.0,
        -- Spawn multiplier for the small cardboard box Minimum=0.00 Maximum=100.00 Default=1.00
        cardboard_small = 1.0,
        -- Spawn multiplier for the cd binder Minimum=0.00 Maximum=100.00 Default=1.00
        cdbinder = 1.0,
        -- Spawn multiplier for the cd case Minimum=0.00 Maximum=100.00 Default=1.00
        cdcase = 1.0,
        -- Spawn multiplier for the coffee can Minimum=0.00 Maximum=100.00 Default=1.00
        coffeecan = 1.0,
        -- Spawn multiplier for the component kit Minimum=0.00 Maximum=100.00 Default=1.00
        componentkit = 1.0,
        -- Spawn multiplier for the cookie jar Minimum=0.00 Maximum=100.00 Default=1.00
        cookiejar = 1.0,
        -- Spawn multiplier for the cutlery roll Minimum=0.00 Maximum=100.00 Default=1.00
        cutleryroll = 1.0,
        -- Spawn multiplier for the dish tub Minimum=0.00 Maximum=100.00 Default=1.00
        dishtub = 1.0,
        -- Spawn multiplier for the donut box Minimum=0.00 Maximum=100.00 Default=1.00
        donutbox = 1.0,
        -- Spawn multiplier for the fakerock Minimum=0.00 Maximum=100.00 Default=1.00
        fakerock = 1.0,
        -- Spawn multiplier for the file folder Minimum=0.00 Maximum=100.00 Default=1.00
        filefolder = 1.0,
        -- Spawn multiplier for the fishing creel Minimum=0.00 Maximum=100.00 Default=1.00
        fishingcreel = 1.0,
        -- Spawn multiplier for the flask Minimum=0.00 Maximum=100.00 Default=1.00
        flask = 1.0,
        -- Spawn multiplier for the foraging pouch Minimum=0.00 Maximum=100.00 Default=1.00
        foragepouch = 1.0,
        -- Spawn multiplier for the half gallon jug Minimum=0.00 Maximum=100.00 Default=1.00
        halfgaljug = 1.0,
        -- Spawn multiplier for the hardware organizer Minimum=0.00 Maximum=100.00 Default=1.00
        hardwareorganizer = 1.0,
        -- Spawn multiplier for the jewelry box Minimum=0.00 Maximum=100.00 Default=1.00
        jewelrybox = 1.0,
        -- Spawn multiplier for the water carrier Minimum=0.00 Maximum=100.00 Default=1.00
        jugempty = 1.0,
        -- Spawn multiplier for the kindling box Minimum=0.00 Maximum=100.00 Default=1.00
        kindlingbox = 1.0,
        -- Spawn multiplier for the kids flask Minimum=0.00 Maximum=100.00 Default=1.00
        kidsflask = 1.0,
        -- Spawn multiplier for the lock box Minimum=0.00 Maximum=100.00 Default=1.00
        lockbox = 1.0,
        -- Spawn multiplier for the milk crate Minimum=0.00 Maximum=100.00 Default=1.00
        milkcrate = 1.0,
        -- Spawn multiplier for the long milk crate Minimum=0.00 Maximum=100.00 Default=1.00
        milkcratelong = 1.0,
        -- Spawn multiplier for the pet carrier Minimum=0.00 Maximum=100.00 Default=1.00
        petcarrier = 1.0,
        -- Spawn multiplier for the piggy bank Minimum=0.00 Maximum=100.00 Default=1.00
        piggybank = 1.0,
        -- Spawn multiplier for the glass pitcher Minimum=0.00 Maximum=100.00 Default=1.00
        pitcherempty_01 = 1.0,
        -- Spawn multiplier for the plastic pitcher Minimum=0.00 Maximum=100.00 Default=1.00
        pitcherempty_02 = 1.0,
        -- Spawn multiplier for the pizza box Minimum=0.00 Maximum=100.00 Default=1.00
        pizzabox = 1.0,
        -- Spawn multiplier for the large plastic tote Minimum=0.00 Maximum=100.00 Default=1.00
        plastictote_large = 1.0,
        -- Spawn multiplier for the medium plastic tote Minimum=0.00 Maximum=100.00 Default=1.00
        plastictote_medium = 1.0,
        -- Spawn multiplier for the small plastic tote Minimum=0.00 Maximum=100.00 Default=1.00
        plastictote_small = 1.0,
        -- Spawn multiplier for the plasticware Minimum=0.00 Maximum=100.00 Default=1.00
        plasticware = 1.0,
        -- Spawn multiplier for the small plasticware Minimum=0.00 Maximum=100.00 Default=1.00
        plasticware_small = 1.0,
        -- Spawn multiplier for the tall plasticware Minimum=0.00 Maximum=100.00 Default=1.00
        plasticware_tall = 1.0,
        -- Spawn multiplier for the roadside kit Minimum=0.00 Maximum=100.00 Default=1.00
        roadsidekit = 1.0,
        -- Spawn multiplier for the rough box Minimum=0.00 Maximum=100.00 Default=1.00
        roughbox = 1.0,
        -- Spawn multiplier for the sandwich bag box Minimum=0.00 Maximum=100.00 Default=1.00
        sandwichbagbox = 1.0,
        -- Spawn multiplier for the sandwich bag Minimum=0.00 Maximum=100.00 Default=1.00
        sandwichbag = 1.0,
        -- Spawn multiplier for the shoebox Minimum=0.00 Maximum=100.00 Default=1.00
        shoebox = 1.0,
        -- Spawn multiplier for the shopping basket Minimum=0.00 Maximum=100.00 Default=1.00
        shoppingbasket = 1.0,
        -- Spawn multiplier for the spice rack Minimum=0.00 Maximum=100.00 Default=1.00
        spicerack = 1.0,
        -- Spawn multiplier for the spiffo keeper Minimum=0.00 Maximum=100.00 Default=1.00
        spiffokeeper = 1.0,
        -- Spawn multiplier for the tackle box Minimum=0.00 Maximum=100.00 Default=1.00
        tacklebox = 1.0,
        -- Spawn multiplier for the large tackle box Minimum=0.00 Maximum=100.00 Default=1.00
        tackleboxlarge = 1.0,
        -- Spawn multiplier for the tissue box Minimum=0.00 Maximum=100.00 Default=1.00
        tissuebox = 1.0,
        -- Spawn multiplier for the travel kit Minimum=0.00 Maximum=100.00 Default=1.00
        travelkit = 1.0,
        -- Spawn multiplier for the trunk organizer Minimum=0.00 Maximum=100.00 Default=1.00
        trunkorganizer = 1.0,
        -- Spawn multiplier for the wood carrier Minimum=0.00 Maximum=100.00 Default=1.00
        woodcarrier = 1.0,
    },
    BuildingMenu = {
        -- Turn <SPACE><RGB:1,0.8,0> OFF <RGB:1,1,1><SPACE> to make structures built using the Building Menu immune to zombie damage.
        isThumpable = true,
        -- This is only a line separator, checking it has no effect.
        EmptyBox1 = false,
        -- This is only a line separator, checking it has no effect.
        WallsCategoryDivider = false,
        -- Enable to add wooden walls structures. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        woodWallsSubCategory = true,
        -- Enable to add clapboard walls structures. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        clapboardWallsSubCategory = true,
        -- Enable to add stone walls structures. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        stoneWallsSubCategory = true,
        -- Enable to add brick walls structures. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        brickWallsSubCategory = true,
        -- Enable to add cinderblock walls structures. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        cinderblockWallsSubCategory = true,
        -- Enable to add painted walls structures. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        paintedWallsSubCategory = true,
        -- Enable to add arched window walls structures. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        archedWindowWallsSubCategory = true,
        -- Enable to add commercial walls structures. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        commercialWallsSubCategory = true,
        -- Enable to add industrial walls structures. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        industrialWallsSubCategory = true,
        -- This is only a line separator, checking it has no effect.
        EmptyBox2 = false,
        -- This is only a line separator, checking it has no effect.
        RoofsCategoryDivider = false,
        -- Enable to add roof structures, such as shingles, shake shingles, glass. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        roofsCategory = true,
        -- This is only a line separator, checking it has no effect.
        EmptyBox3 = false,
        -- This is only a line separator, checking it has no effect.
        DoorsCategoryDivider = false,
        -- Enable to add Wooden, Low, Panel, Metal, Glass doors. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        doorsSubCategory = true,
        -- Enable to add 3 and 4 Tile Garage Doors. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        garageDoorsSubCategory = true,
        -- This is only a line separator, checking it has no effect.
        EmptyBox4 = false,
        -- This is only a line separator, checking it has no effect.
        ArchitecturePlusCategoryDivider = false,
        -- Enable to add Door Trims, Crown Molding, Edge Detailing, Floor Molding and Wall Panels. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        architecturePlusCategory = true,
        -- This is only a line separator, checking it has no effect.
        EmptyBox5 = false,
        -- This is only a line separator, checking it has no effect.
        WindowsCategoryDivider = false,
        -- Enable to add Windows. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        windowsCategory = true,
        -- This is only a line separator, checking it has no effect.
        EmptyBox6 = false,
        -- This is only a line separator, checking it has no effect.
        FencingCategoryDivider = false,
        -- Enable to add High Fences. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        highFencesSubCategory = true,
        -- Enable to add Low Fences and Railings. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        lowAndRailingFencesSubCategory = true,
        -- Enable to add other Fences such as Hesco Barrier, Low Metal Fences, Brick Fences. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        otherFencesSubCategory = true,
        -- This is only a line separator, checking it has no effect.
        EmptyBox7 = false,
        -- This is only a line separator, checking it has no effect.
        FloorsCategoryDivider = false,
        -- Enable to add Low Fences and Railings. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        floorsCategory = true,
        -- This is only a line separator, checking it has no effect.
        EmptyBox8 = false,
        -- This is only a line separator, checking it has no effect.
        StairsCategoryDivider = false,
        -- Enable to add Stairs. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        stairsCategory = true,
        -- This is only a line separator, checking it has no effect.
        EmptyBox9 = false,
        -- This is only a line separator, checking it has no effect.
        RoadworkCategoryDivider = false,
        -- Enable to add asphalt. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        roadworkAsphaltSubCategory = true,
        -- Enable to add overlays such as Grime and Street Cracks. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        roadworkOverlaysSubCategory = false,
        -- Enable to add Sidewalk Edge Overlays. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        roadworkSidewalkEdgeSubCategory = false,
        -- Enable to add Dirt and Grass tiles. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        roadworkDirtandGrassSubCategory = false,
        -- Enable to add Painted Road Markings. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        roadworkPaintedRoadMarkingsSubCategory = true,
        -- This is only a line separator, checking it has no effect.
        EmptyBox10 = false,
        -- This is only a line separator, checking it has no effect.
        ContainersCategoryDivider = false,
        -- Enable to add Kitchen Counters, Upper Counters. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        kitchenCountersSubCategory = true,
        -- Enable to add Restaurant, Cafe, Bar, Diner Counters. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        commercialCountersSubCategory = true,
        -- Enable to add simple Crates, Military Crates(100 capacity), Cardboard Boxes. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        cratesSubCategory = true,
        -- Enable to add Metal Containers, Large Metal Shelves, Lockers. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        metalContainersSubCategory = true,
        -- Enable to add Clothes Racks and Mannequins. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        clothesRacksSubCategory = false,
        -- Enable to add trash cans. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        trashCansSubCategory = true,
        -- Enable to add Other Containers Subcategory. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        containersOthersSubCategory = true,
        -- This is only a line separator, checking it has no effect.
        EmptyBox11 = false,
        -- This is only a line separator, checking it has no effect.
        RecreationalCategoryDivider = false,
        -- Enable to add jukeboxes, pianos and such. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        musicSubCategory = false,
        -- This is only a line separator, checking it has no effect.
        EmptyBox12 = false,
        -- This is only a line separator, checking it has no effect.
        FurnitureCategoryDivider = false,
        -- Enable to add Small and Large Tables. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        tablesSubCategory = false,
        -- Enable to add Simple and Large Beds. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        bedsSubCategory = false,
        -- Enable to add Benches, Couches, Chairs. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        seatingFurnitureSubCategory = false,
        -- Enable to add Bookshelves. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        bookshelvesSubCategory = true,
        -- Enable to add Dressers, Drawers and Wardrobes. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        dressersAndWardrobesSubCategory = true,
        -- This is only a line separator, checking it has no effect.
        EmptyBox13 = false,
        -- This is only a line separator, checking it has no effect.
        DecorationsCategoryDivider = false,
        -- Enable to add Rugs. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        rugsSubCategory = true,
        -- Enable to add Curtains. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        curtainsSubCategory = false,
        -- Enable to add Posters and Signs. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        postersAndSignsSubCategory = false,
        -- Enable to add Graffiti. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        graffitiSubCategory = false,
        -- Enable to add Other Decorations, such as road blocks, mailbox, barrier post, road cones, mail box. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        otherDecorationsSubCategory = false,
        -- This is only a line separator, checking it has no effect.
        EmptyBox14 = false,
        -- This is only a line separator, checking it has no effect.
        VegetationCategoryDivider = false,
        -- Enable to add Flower Beds in Vegetation Category. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        flowerBedsSubCategory = true,
        -- Enable to add Indoor Plants, such as Flower Pots in Vegetation Category. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        indoorPlantsSubCategory = true,
        -- Enable to add Outdoor Plants, such as outdoor Flower Containers in Vegetation Category. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        outdoorPlantsSubCategory = true,
        -- Enable to add Landscaping Vegetation, such as Grass, Hedges, Wall Vines in Vegetation Category. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        landscapingSubCategory = false,
        -- This is only a line separator, checking it has no effect.
        EmptyBox15 = false,
        -- This is only a line separator, checking it has no effect.
        SurvivalCategoryDivider = false,
        -- Enable to add Fireplace and Jambs. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        fireplaceSubCategory = false,
        -- Enable to add the Generator. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        generatorSubCategory = false,
        -- Enable to add metal drums. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        metalDrums = true,
        -- Enable to add water wells. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        waterWell = true,
        -- This is only a line separator, checking it has no effect.
        EmptyBox16 = false,
        -- This is only a line separator, checking it has no effect.
        AppliancesCategoryDivider = false,
        -- Enable to add Lighting Category. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        lightingAppliances = true,
        -- Enable to add Sinks, Toilets and other bathroom-related objects. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        bathroomAppliances = false,
        -- Enable to add Stoves, Ovens and other cooking-related objects. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        cookingAppliances = false,
        -- Enable to add Fridges and Freezers. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        fridgeAppliances = false,
        -- Enable to add Washers and Dryers. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        laundryAppliances = false,
        -- This is only a line separator, checking it has no effect.
        DaddyDirkieCategoryDivider = false,
        -- Enable to add Daddy Dirkie furniture. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        daddyDirkieFurniture = true,
        -- Enable to add dirt, sand and asphalt ramps. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        daddyDirkieRoadworkRamps = false,
        -- Enable to add secret entrances. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        daddyDirkieSecretEntrances = true,
        -- Enable to add forest survival structures. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        daddyDirkieForestSurvival = true,
        -- This is only a line separator, checking it has no effect.
        DylanCategoryDivider = false,
        -- Enable to add barricades. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        dylanBarricades = false,
        -- This is only a line separator, checking it has no effect.
        MelosTilesCategoryDivider = false,
        -- Enable to add Castle structures. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        melosTilesCastleWalls = true,
        -- Enable to add Castle structures. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        melosTilesBathroomWalls = true,
        -- This is only a line separator, checking it has no effect.
        PertsPartyCategoryDivider = false,
        -- Enable to add ginger bread structures, christmas lighting. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        pertsPartyChristmas = true,
        -- Enable to add Halloween Decorations. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        pertsPartyHalloween = true,
        -- This is only a line separator, checking it has no effect.
        SimonMDCategoryDivider = false,
        -- Enable to add secret entrances. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES!
        simonMDSecretEntrances = true,
    },
    BuildingMenuRecipes = {
        -- This is only a line separator, checking it has no effect.
        MaterialsDivider = false,
        -- Disable to remove paint from recipes, those with paint as the only ingredient will remain. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1><LINE>
        usePaint = true,
        -- Uses per paint can. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1> Default=10 Uses
        -- 1 = 4 Uses
        -- 2 = 8 Uses
        -- 3 = 10 Uses
        -- 4 = 14 Uses
        -- 5 = 18 Uses
        -- 6 = 22 Uses
        -- 7 = 26 Uses
        -- 8 = 28 Uses
        -- 9 = 45 Uses
        -- 10 = 60 Uses
        -- 11 = 80 Uses
        -- 12 = 100 Uses
        paintUses = 3,
        -- Uses per blow torch. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1> Default=10 Uses
        -- 1 = 4 Uses
        -- 2 = 8 Uses
        -- 3 = 10 Uses
        -- 4 = 14 Uses
        -- 5 = 18 Uses
        -- 6 = 22 Uses
        -- 7 = 26 Uses
        -- 8 = 28 Uses
        -- 9 = 45 Uses
        -- 10 = 60 Uses
        -- 11 = 80 Uses
        -- 12 = 100 Uses
        blowTorchUses = 12,
        -- Uses per Bucket with Asphalt Mixture. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1> Default=10 Uses
        -- 1 = 4 Uses
        -- 2 = 8 Uses
        -- 3 = 10 Uses
        -- 4 = 14 Uses
        -- 5 = 18 Uses
        -- 6 = 22 Uses
        -- 7 = 26 Uses
        -- 8 = 28 Uses
        -- 9 = 45 Uses
        -- 10 = 60 Uses
        -- 11 = 80 Uses
        -- 12 = 100 Uses
        bucketAsphaltMixtureUses = 3,
        -- Uses per Bucket with Concrete. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1> Default=10 Uses
        -- 1 = 4 Uses
        -- 2 = 8 Uses
        -- 3 = 10 Uses
        -- 4 = 14 Uses
        -- 5 = 18 Uses
        -- 6 = 22 Uses
        -- 7 = 26 Uses
        -- 8 = 28 Uses
        -- 9 = 45 Uses
        -- 10 = 60 Uses
        -- 11 = 80 Uses
        -- 12 = 100 Uses
        bucketConcreteUses = 3,
        -- Sets wood needed for BIG Walls. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1> Minimum=1 Maximum=100 Default=6
        bigWallWoodCount = 6,
        -- Sets nails needed for BIG Walls. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1> Minimum=1 Maximum=100 Default=6
        bigWallNailsCount = 8,
        -- Sets wood needed for SMALL Walls. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1> Minimum=1 Maximum=100 Default=3
        smallWallWoodCount = 3,
        -- Sets nails needed for SMALL Walls. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1> Minimum=1 Maximum=100 Default=4
        smallWallNailsCount = 4,
        -- Sets wood needed for BIG Objects. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1> Minimum=1 Maximum=100 Default=6
        bigObjectsWoodCount = 6,
        -- Sets nails needed for BIG Objects. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1> Minimum=1 Maximum=100 Default=8
        bigObjectsNailsCount = 10,
        -- Sets wood needed for SMALL Objects. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1> Minimum=1 Maximum=100 Default=4
        smallObjectsWoodCount = 4,
        -- Sets nails needed for SMALL Objects. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1> Minimum=1 Maximum=100 Default=6
        smallObjectsNailsCount = 6,
        -- Sets glass panes needed. <LINE> Scales with object size and type. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1> Minimum=1 Maximum=100 Default=2
        glassPaneCount = 2,
        -- Sets metal bars needed. <LINE> Scales with object size and type. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1> Minimum=1 Maximum=100 Default=4
        metalBarsCount = 4,
        -- Sets screws needed. <LINE> Scales with object size and type. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1> Minimum=1 Maximum=100 Default=10
        screwsCount = 10,
        -- Sets scrap metal needed for fences. <LINE> Scales with object size and type. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1> Minimum=1 Maximum=100 Default=10
        scrapMetalCountForFences = 20,
        -- Sets scrap metal needed for electrical things. <LINE> Scales with object size and type. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1> Minimum=1 Maximum=100 Default=5
        scrapMetalCountForElectrical = 10,
        -- Sets sheet metal needed for WALLS. <LINE> Scales with object size and type. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1> Minimum=1 Maximum=100 Default=5
        sheetMetalCountForWalls = 5,
        -- Sets sheet metal needed for DOORS. <LINE> Scales with object size and type. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1> Minimum=1 Maximum=100 Default=4
        sheetMetalCountForDoors = 4,
        -- Sets sheet metal needed for CONTAINERS. <LINE> Scales with object size and type. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1> Minimum=1 Maximum=100 Default=4
        sheetMetalCountForContainers = 4,
        -- Sets sheet metal needed for FIXTURES and APPLIANCES. <LINE> Scales with object size and type. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1> Minimum=1 Maximum=100 Default=4
        sheetMetalCountForFixturesAndAppliances = 4,
        -- Sets sheet metal needed for ROOFING and FLOORS. <LINE> Scales with object size and type. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1> Minimum=1 Maximum=100 Default=1
        sheetMetalCountForRoofingAndFloors = 1,
        -- Sets small metal sheet needed for ROOFING and FLOORS. <LINE> Scales with object size and type. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1> Minimum=1 Maximum=100 Default=2
        smallSheetMetalCountForRoofingAndFloors = 2,
        -- This is only a line separator, checking it has no effect.
        EmptyBox1 = false,
        -- This is only a line separator, checking it has no effect.
        SkillsDivider = false,
        -- Sets carpentry level needed for BIG Objects. <LINE> Scales with object size and type. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1> Minimum=1 Maximum=10 Default=5
        bigObjectsCarpentrySkill = 5,
        -- Sets carpentry level needed for SMALL Objects. <LINE> Scales with object size and type. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1> Minimum=1 Maximum=10 Default=4
        smallObjectsCarpentrySkill = 4,
        -- XP gain per carpentry level when building objects. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1> Minimum=0.05 Maximum=100.00 Default=2.50
        carpentryXpPerLevel = 2.5,
        -- XP gain per metalworking level when building objects. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1> Minimum=0.05 Maximum=100.00 Default=3.50
        metalweldingXpPerLevel = 3.5,
        -- XP gain per electrical level when building objects. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1> Minimum=0.05 Maximum=100.00 Default=5.00
        electricalXpPerLevel = 5.0,
        -- This is only a line separator, checking it has no effect.
        EmptyBox2 = false,
        -- This is only a line separator, checking it has no effect.
        SpecialObjectsRecipesDivider = false,
        -- How much water a Well hold. Minimum=1 Maximum=9998 Default=1500
        maxWaterWellStorageAmount = 1500,
        -- Multiplier for the amount of water added to the well during rain. Minimum=0.10 Maximum=10.00 Default=1.00
        waterWellRainIntensityMul = 1.0,
        -- Range of water amount added to the well every hour. For example '1;5' will generate a random number between 1 and 5, '5' will always generate 5 units of water. Default=1;5
        waterWellHourlyRefillRateInterval = "1;5",
        -- Sets planks required for Military Crates. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1> Minimum=1 Maximum=100 Default=15
        plankCountForMilitaryCrate = 15,
        -- Sets nails required for Military Crates. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1> Minimum=1 Maximum=100 Default=10
        nailsCountForMilitaryCrate = 10,
        -- Sets carpentry level needed for Military Crates. <LINE><LINE> <RGB:1,0,0> EXIT AND REENTER SAVE TO APPLY CHANGES! <RGB:1,1,1> Minimum=1 Maximum=10 Default=9
        militaryCrateCarpentrySkill = 9,
    },
    SapphCooking = {
        -- Default=Rare
        -- 1 = Insanely rare
        -- 2 = Extremely Rare
        -- 3 = Rare
        -- 4 = Normal
        -- 5 = Common
        -- 6 = Abundant
        NonPerishableChance = 2,
        -- Default=Rare
        -- 1 = Insanely rare
        -- 2 = Extremely Rare
        -- 3 = Rare
        -- 4 = Normal
        -- 5 = Common
        -- 6 = Abundant
        PerishableChance = 2,
        -- Default=Rare
        -- 1 = Insanely rare
        -- 2 = Extremely Rare
        -- 3 = Rare
        -- 4 = Normal
        -- 5 = Common
        -- 6 = Abundant
        SpicesSpawnChance = 3,
        -- Default=Rare
        -- 1 = Insanely rare
        -- 2 = Extremely Rare
        -- 3 = Rare
        -- 4 = Normal
        -- 5 = Common
        -- 6 = Abundant
        CannedSpawnChance = 3,
        -- Default=Rare
        -- 1 = Insanely rare
        -- 2 = Extremely Rare
        -- 3 = Rare
        -- 4 = Normal
        -- 5 = Common
        -- 6 = Abundant
        MagazineChance = 1,
        -- Default=Rare
        -- 1 = Insanely rare
        -- 2 = Extremely Rare
        -- 3 = Rare
        -- 4 = Normal
        -- 5 = Common
        -- 6 = Abundant
        MREChance = 2,
        -- Default=Rare
        -- 1 = Insanely rare
        -- 2 = Extremely Rare
        -- 3 = Rare
        -- 4 = Normal
        -- 5 = Common
        -- 6 = Abundant
        KitchenUtensilsChance = 3,
        -- Default=Rare
        -- 1 = Insanely rare
        -- 2 = Extremely Rare
        -- 3 = Rare
        -- 4 = Normal
        -- 5 = Common
        -- 6 = Abundant
        AlcoholChance = 2,
        -- Default=Rare
        -- 1 = Insanely rare
        -- 2 = Extremely Rare
        -- 3 = Rare
        -- 4 = Normal
        -- 5 = Common
        -- 6 = Abundant
        ZombieLootSpawn = 2,
    },
    HuntingMod = {
        -- <RED> <CENTRE> [THIS OPTION DOES NOT DO ANYTHING]
        Separation_EmptyBox0 = false,
        -- <RED> <CENTRE> [THIS OPTION DOES NOT DO ANYTHING] <BR> <LEFT> <RGB:1,1,1> Customize the chance for tracks of animals to spawn.
        Separation_ForageSpawn = false,
        -- Bird spottings will be more common than normal in cities due to nature taking over in populated areas. Small and big animals will also be present in cities thanks to this setting.
        YearsLater = false,
        -- Boost to spawns of bird tracks. Minimum=0 Maximum=500 Default=100
        BirdsForage = 100,
        -- Boost to spawns of tiny game tracks. Minimum=0 Maximum=500 Default=100
        TinyGameForage = 100,
        -- Boost to spawns of small game tracks. Minimum=0 Maximum=500 Default=100
        SmallGameForage = 100,
        -- Boost to spawns of big games tracks. Minimum=0 Maximum=500 Default=100
        BigGameForage = 100,
        -- Boost to spawns of tracks in nature areas such as forests and deep forests. Minimum=0 Maximum=500 Default=100
        NatureAreasForage = 100,
        -- Boost to spawns of tracks in areas with human activity such as cities, farms and roads. Minimum=0 Maximum=500 Default=100
        HumanAreasForage = 100,
        -- <RED> <CENTRE> [THIS OPTION DOES NOT DO ANYTHING]
        Separation_EmptyBox1 = false,
        -- <RED> <CENTRE> [THIS OPTION DOES NOT DO ANYTHING] <BR> <LEFT> <RGB:1,1,1> Set the general options.
        Separation_General = false,
        -- Chance to hunt a spotting will be shown in the tooltip.
        ShowProbabilities = true,
        -- Preys will have their minimum food value be this percentage of their default food value. Minimum=0 Maximum=500 Default=80
        MinimumBonusSize = 80,
        -- Preys will have their maximum food value be this percentage of their default food value. Minimum=0 Maximum=500 Default=150
        MaximumBonusSize = 150,
        -- When shred due to a gun too powerful, preys will have their minimum food value be this percentage of their default food value. Minimum=0 Maximum=500 Default=10
        MinimumBonusSizeShred = 10,
        -- When shred due to a gun too powerful, preys will have their maximum food value be this percentage of their default food value. Minimum=0 Maximum=500 Default=20
        MaximumBonusSizeShred = 20,
        -- Hunting gives XP in the category of the weapon used (aiming for guns, and for melee weapons their respective skills). This value is not exact and depends on your experience boost in the skill category of the weapon. It also gives XP in foraging. Minimum=0 Maximum=200 Default=30
        XPGainHunting = 30,
        -- Discarding a hunt gives XP in foraging. Minimum=0 Maximum=200 Default=30
        XPGainDiscard = 30,
        -- <RED> <CENTRE> [THIS OPTION DOES NOT DO ANYTHING]
        Separation_EmptyBox2 = false,
        -- <RED> <CENTRE> [THIS OPTION DOES NOT DO ANYTHING] <BR> <LEFT> <RGB:1,1,1> Set the impact of aiming on hunting. Some guns are more adapted for certain types of targets, such as shotguns for birds and rifles or small or big game.
        Separation_AimingImpact = false,
        -- The user aiming skill will impact hunting conditions. 
        AimingImpact = true,
        -- Minimum=0 Maximum=10 Default=0
        MinimumAimingLevelToHunt = 0,
        -- The minimum level in aiming required for a character to be able to hunt with a gun. Minimum=0 Maximum=10 Default=10
        MaximumAimingLevelToHunt = 10,
        -- If your aiming is the minimum level required to be able to hunt, the impact due to aiming on the hunting chance will be this value. Minimum=0 Maximum=500 Default=50
        MinimumAimingImpact = 50,
        -- If your aiming is the maximum level (or more), the impact due to aiming on the hunting chance will be this value. Minimum=0 Maximum=500 Default=150
        MaximumAimingImpact = 150,
        -- <RED> <CENTRE> [THIS OPTION DOES NOT DO ANYTHING]
        Separation_EmptyBox3 = false,
        -- <RED> <CENTRE> [THIS OPTION DOES NOT DO ANYTHING] <BR> <LEFT> <RGB:1,1,1> Set the impact of melee on hunting. Depends on the category of the weapon (blunt, spear, long blade...)
        Separation_MeleeImpact = false,
        -- Minimum=0 Maximum=10 Default=0
        MinimumMeleeLevelToHunt = 0,
        -- The minimum level in melee skills required for a character to be able to hunt with a melee weapon. Minimum=0 Maximum=10 Default=10
        MaximumMeleeLevelToHunt = 10,
        -- If your melee is the minimum level required to be able to hunt, the impact due to melee on the hunting chance will be this value. Minimum=0 Maximum=500 Default=50
        MinimumMeleeImpact = 50,
        -- If your melee is the maximum level (or more), the impact due to melee on the hunting chance will be this value. Minimum=0 Maximum=500 Default=150
        MaximumMeleeImpact = 150,
        -- <RED> <CENTRE> [THIS OPTION DOES NOT DO ANYTHING]
        Separation_EmptyBox4 = false,
        -- <RED> <CENTRE> [THIS OPTION DOES NOT DO ANYTHING] <BR> <LEFT> <RGB:1,1,1> Set the impact of strength on hunting, only impacts melee.
        Separation_StrengthImpact = false,
        -- The user strength skill will impact hunting conditions. 
        StrengthImpact = true,
        -- Minimum=0 Maximum=10 Default=1
        MinimumStrengthLevelToHunt = 1,
        -- The minimum level in strength required for a character to be able to hunt with a melee weapon. Minimum=0 Maximum=10 Default=10
        MaximumStrengthLevelToHunt = 10,
        -- If your strength is the minimum level required to be able to hunt, the impact due to strength on the hunting chance will be this value. Minimum=0 Maximum=500 Default=50
        MinimumStrengthImpact = 50,
        -- If your strength is the maximum level (or more), the impact due to strength on the hunting chance will be this value. Minimum=0 Maximum=500 Default=150
        MaximumStrengthImpact = 150,
        -- <RED> <CENTRE> [THIS OPTION DOES NOT DO ANYTHING]
        Separation_EmptyBox5 = false,
        -- <RED> <CENTRE> [THIS OPTION DOES NOT DO ANYTHING] <BR> <LEFT> <RGB:1,1,1> Set the impact of stealth on hunting. Sneaking and lightfoot count towards your stealth skills (mean between sneaking and lightfoot).
        Separation_StealthImpact = false,
        -- The user stealth skills will impact hunting conditions. 
        StealthImpact = true,
        -- The impact due to stealth on the hunting chance will be this value when at stealth of 0 (mean between sneaking and lightfoot). Minimum=0 Maximum=500 Default=70
        MinimumStealthImpact = 70,
        -- The impact due to stealth on the hunting chance will be this value when at stealth of 10 (mean between sneaking and lightfoot). Minimum=0 Maximum=500 Default=150
        MaximumStealthImpact = 150,
        -- <RED> <CENTRE> [THIS OPTION DOES NOT DO ANYTHING]
        Separation_EmptyBox6 = false,
        -- <RED> <CENTRE> [THIS OPTION DOES NOT DO ANYTHING] <BR> <LEFT> <RGB:1,1,1> Set the impact of other conditions on hunting.
        Separation_OtherImpact = false,
        -- When having a scope on the gun used to hunt, it will boost the hunting chance by this amount. Minimum=0 Maximum=200 Default=30
        ScopeBonus = 30,
        -- The weapon and the user aiming skill will impact hunting conditions. This can boost the hunting chance or decrease it. Minimum=0 Maximum=500 Default=100
        WeaponImpact = 100,
        -- Lightness of the day will impact hunting conditions. This can boost the hunting chance or decrease it. Minimum=0 Maximum=500 Default=100
        LightImpact = 100,
        -- Fog will impact hunting conditions. This can boost the hunting chance or decrease it. Minimum=0 Maximum=500 Default=100
        FogImpact = 100,
        -- Wind will impact hunting conditions. This can boost the hunting chance or decrease it. Minimum=0 Maximum=500 Default=100
        WindImpact = 100,
        -- Traits will impact hunting conditions. This can boost the hunting chance or decrease it. Minimum=0 Maximum=500 Default=100
        TraitImpact = 100,
        -- Moodles will impact hunting conditions: cold, hypothermia. This can boost the hunting chance or decrease it. Minimum=0 Maximum=500 Default=100
        MoodleImpact = 100,
        -- Final chance of hunting a target will be boosted by this multiplier. 100% won't boost the hunting chance while a lower value will reduce overall chance of hunting and a higher value will increase the chance of hunting the target. Minimum=0 Maximum=500 Default=100
        BoostToHuntingChance = 100,
    },
    FirstAidOverhaul = {
        -- From this level onward, the Player will be able to treat fractures.  Minimum=0 Maximum=10 Default=1
        FractureTreatmentLevel = 1,
        -- From this level onward, the Player will be able to stitch wounds.  Minimum=0 Maximum=10 Default=2
        StitchingTreatmentLevel = 2,
        -- From this level onward, the Player won't have a chance to fail wound treatments.  Minimum=0 Maximum=10 Default=4
        FailureLevelThreshold = 4,
        -- The chance of failure when treating wounds.  Minimum=0 Maximum=100 Default=30
        FailureChance = 30,
        -- How much disease percentage you can get from a single infected wound.  Minimum=0 Maximum=100 Default=26
        MaxDiseasePerWound = 26,
        -- How much disease percentage you can get from all infected wounds combined.  Minimum=0 Maximum=100 Default=100
        InfectionDiseaseLimit = 100,
        -- How many in-game minutes before you can practice first aid on corpses again.  Minimum=1 Maximum=1440 Default=60
        PracticeCooldown = 60,
        -- How much XP the Player receives when performing this practice in a corpse.  Minimum=1 Maximum=1000 Default=10
        BandagePracticeXP = 10,
        -- How much XP the Player receives when performing this practice in a corpse.  Minimum=1 Maximum=1000 Default=25
        SuturePracticeXP = 25,
        -- How much XP the Player receives when performing this practice in a corpse.  Minimum=1 Maximum=1000 Default=50
        StudyPracticeXP = 50,
        -- How much XP the Player receives when performing this practice in a corpse.  Minimum=1 Maximum=1000 Default=75
        ScalpelPracticeXP = 75,
        -- Makes wound treatment faster or slower.  Minimum=0.10 Maximum=5.00 Default=1.00
        SpeedMultiplier = 1.0,
        -- Display cheaty info of wounds when at Level 8 or higher. 
        ShowDebugInfo = true,
    },
    BLTAnnotations = {
        -- If enabled, player corpses will include a fully annotated map containing every symbols from their main map
        DropMapOnDeath = false,
    },
    VehicleRepairOverhaul = {
        DisableVehicleSalvage = false,
    },
    SOMW = {
        -- Reduces chance of breaking melee weapons by the specified multiplier.
        -- For example: choosing a value of "3" means that the weapon will break approximately 3 times slower. Default=1
        -- 1 = 1
        -- 2 = 2
        -- 3 = 3
        -- 4 = 5
        CondLowerChanceMultiplier = 1,
        -- For example: selecting "75%" means that wood materials will weigh 25% less. Default=100%
        -- 1 = 100%
        -- 2 = 75%
        -- 3 = 50%
        -- 4 = 25%
        WoodWeight = 4,
        -- For example: selecting "75%" means that metal materials will weigh 25% less. Default=100%
        -- 1 = 100%
        -- 2 = 75%
        -- 3 = 50%
        -- 4 = 25%
        MetalWeight = 3,
    },
    NamedLiterature = {
        -- The amount of 10 minute intervals needed for a return of bonuses when reading. Minimum=0 Maximum=1000000 Default=26280
        TimeToForget = 26280,
        -- The amount of times each piece of literature can be read. This number divides the bonuses given from reading. Minimum=1 Maximum=100 Default=3
        MaxTimesReadable = 3,
        -- If true, diminished bonus from reading stay at a capped amount. If false, the bonuses are 0.
        CanReadPassedMax = true,
    },
    Advanced_trajectory = {
        -- Show or hide crosshair.
        aimpoint = true,
        showOutlines = false,
        hideTracer = false,
        Enablerange = true,
        Enablethrow = true,
        -- For debugging, character says what body part was shot.
        callshot = false,
        -- Need to check this if you want gun PVP with safety features OFF. UNCHECK IF YOU HAVE PVP OFF AND DO NOT WANT GUN PVP!
        IgnorePVPSafety = false,
        enableBulletPenFlesh = true,
        -- Multiplies base damage of bullet. Minimum=0.00 Maximum=100.00 Default=1.00
        ATY_damage = 1.0,
        -- Ex: 0.1 means nerf bullet damage by 90% after penetrating through first zombie/player. Minimum=0.00 Maximum=1.00 Default=0.25
        penDamageReductionMultiplier = 0.25,
        -- Minimum=0.00 Maximum=100.00 Default=0.00
        DebugOffset = 0.0,
        -- Minimum=0.00 Maximum=100.00 Default=0.00
        DebugSpawnOffset = 0.0,
        -- Minimum=0.00 Maximum=10.00 Default=0.42
        DebugZomMindistCondition = 0.42,
        -- Minimum=0.00 Maximum=10.00 Default=0.40
        DebugPlayerMindistCondition = 0.4,
        -- Minimum=0.00 Maximum=10.00 Default=0.50
        DebugGridMultiplier = 0.5,
        DebugEnableBow = true,
        DebugEnableVoodoo = false,
        DebugSayShotPart = false,
        DebugRemoveFootHitbox = false,
        -- Minimum=0 Maximum=1 Default=0
        DebugHitCountShoot = 0,
        -- Minimum=1.00 Maximum=100.00 Default=30.00
        bowBreakChance = 30.0,
        -- Minimum=-10.00 Maximum=10.00 Default=0.10
        hitRegThreshold = 0.1,
        -- Minimum=0.00 Maximum=300.00 Default=3.00
        XPKillModifier = 2.0,
        -- Minimum=0.00 Maximum=300.00 Default=0.50
        XPHitModifier = 0.5,
        -- Minimum=0.00 Maximum=1.00 Default=0.50
        MaxProjCone = 0.6,
        -- Value that limits how much bloom is added to crosshair. Higher means larger possible bloom. Minimum=0.00 Maximum=20.00 Default=7.00
        maxaimnum = 7.0,
        -- Value that affects crosshair's minimum bloom. Characters with low aiming level (0-2) will never be accurate (always has bloom). Set to 0 if you want to be OP or unlock focus mechanic at level 3. Minimum=0.00 Maximum=100.00 Default=7.00
        minaimnumModifier = 8.0,
        -- Aiming level in which player unlocks the focus mechanic. Minimum=0.00 Maximum=10.00 Default=3.00
        focusLevel = 3.0,
        -- Player loses accuracy when trying to shoot targets past their distance limit. Uncheck to disable.
        enableDistanceLimitPenalty = true,
        -- Higher means more punishing bloom scaling. Minimum=0.00 Maximum=10.00 Default=2.00
        distanceFocusPenalty = 3.0,
        -- Value affects how much bloom is added when reloading and racking firearm. Minimum=0.00 Maximum=10.00 Default=0.10
        reloadEffectModifier = 0.15,
        -- Value that affects how fast your crosshair tightens. Higher means faster. Minimum=0.00 Maximum=100.00 Default=1.10
        reducespeed = 1.1,
        -- Driving part of the focus mechanic. Determines time it takes for the crosshair to begin its process of reducing aimnum to 0 (max accuracy). This is a flat value. Set to 0 to disable if you want to remove ability to gain max accuracy without waiting. Minimum=0.00 Maximum=10.00 Default=2.00
        focusCounterSpeed = 4.0,
        -- Multiplier that determines how much focus counter/timer should be shorten based off of aiming level.  Minimum=0.00 Maximum=10.00 Default=7.00
        focusCounterSpeedScaleModifier = 7.0,
        -- Part of the focus mechanic. Determines speed of crosshair reducing aimnum to 0 once process has begun. Minimum=0.00 Maximum=1.00 Default=1.00
        maxFocusSpeed = 1.0,
        -- If enabled, player will have a chance of missing depending on bloom. Bullet will pass through zombies without damaging them.
        enableHitOrMiss = false,
        -- Player will announce if their bullet hit or missed with bloom value comparisons.
        announceHitOrMiss = false,
        -- A flat value that gives a flat increase in chances of hitting zombies with a shotgun. Minimum=0.00 Maximum=200.00 Default=60.00
        shotgunHitBuff = 0.0,
        -- Affects how much aiming level will decrease the chances of not missing. Higher means lower chance of missing per level. Minimum=0.00 Maximum=20.00 Default=2.00
        hitLevelScaling = 3.0,
        -- Bloom value in which player will start having a chance of missing. Must be less than max. rand(minMiss + buff + aimLevel*hitScaling, maxMiss) Minimum=0.00 Maximum=300.00 Default=25.00
        missMin = 15.0,
        -- Bloom value in which player will start having a chance of missing. Must be greater than min. rand(minMiss + buff + aimLevel*hitScaling, maxMiss) Minimum=0.00 Maximum=300.00 Default=120.00
        missMax = 100.0,
        -- Makes crosshair slightly transparent when bloom reaches miss min so players know when they'll start having a chance of missing. Minimum=0.00 Maximum=1.00 Default=0.30
        missMinTransparency = 0.3,
        -- Linked to Focus Counter Speed. Part of the focus mechanic. Weapon's recoil delay affects how long it takes for character to recover from recoil and this is a multiplier of that. Set to 0 to ignore weapon's recoil delay stat. Minimum=0.00 Maximum=1.00 Default=0.01
        recoilDelayModifier = 0.01,
        -- Multiplier of gun's max dmg added as recoil to crosshair (adds bloom when shooting). Minimum=0.00 Maximum=30.00 Default=10.00
        recoilModifier = 12.0,
        -- Affects exponential growth of recoil (how much bloom is added depending on the previous bloom value the player shot at). Lower means less added bloom as you continue spraying. Minimum=0.00 Maximum=200.00 Default=80.00
        recoilScaleModifier = 80.0,
        -- Multiplier reduction to gun recoil. Minimum=0.00 Maximum=1.00 Default=0.70
        proneRecoilBuff = 0.7,
        -- Multiplier that affects how much bloom is added depending on the previous bloom value the player shot at. Lower means less added bloom as you continue spraying. Minimum=0.00 Maximum=1.00 Default=0.50
        proneExpoRecoilBuff = 0.5,
        -- Multiplier reduction to gun recoil. Minimum=0.00 Maximum=1.00 Default=0.80
        crouchRecoilBuff = 0.8,
        -- Multiplier that affects how much bloom is added depending on the previous bloom value the player shot at. Lower means less added bloom as you continue spraying. Minimum=0.00 Maximum=1.00 Default=0.75
        crouchExpoRecoilBuff = 0.75,
        -- Minimum=0.00 Maximum=2.40 Default=1.70
        bulletspeed = 2.4,
        -- Minimum=0.00 Maximum=100.00 Default=4.00
        bulletdistance = 4.0,
        -- When aiming moving and turnin. Minimum=0.00 Maximum=10.00 Default=10.00
        runNGunLv = 10.0,
        -- Multiplier that reduces penalty for moving and turning. 0.25 means 75% reduction to penalty. Minimum=0.00 Maximum=1.00 Default=0.50
        runNGunBuff = 0.5,
        -- Value that adds bloom when moving. Minimum=0.00 Maximum=100.00 Default=1.30
        moveeffect = 1.3,
        -- Value that adds bloom when physically turning your feet, not hips. Minimum=0.00 Maximum=100.00 Default=0.70
        turningeffect = 0.7,
        -- Minimum=0.00 Maximum=10.00 Default=8.00
        crouchCounterSpeed = 8.0,
        -- Minimum=0.00 Maximum=10.00 Default=2.00
        crouchPenaltyModifier = 2.0,
        -- Minimum=0.00 Maximum=10.00 Default=3.00
        crouchTurnEffect = 3.0,
        -- Minimum=0.00 Maximum=10.00 Default=5.00
        proneTurnEffect = 5.0,
        -- Reduces minimum bloom limit by a percentage; lower means smaller crosshair Minimum=0.00 Maximum=1.00 Default=0.50
        crouchFocusLimitBuff = 0.5,
        -- Reduces minimum bloom limit by a percentage; lower means smaller crosshair" Minimum=0.00 Maximum=1.00 Default=0.30
        proneFocusLimitBuff = 0.3,
        -- When proning, you gain max accuracy faster (applies when focus mechanic is unlocked). Minimum=0.00 Maximum=10.00 Default=1.50
        proneFocusCounterSpeedBuff = 1.5,
        -- When proning, your crosshair reduces bloom faster. Helpful after intense cardio. Minimum=0.00 Maximum=2.00 Default=0.40
        proneReduceSpeedBuff = 0.4,
        -- When crouching, your crosshair reduces bloom faster. Helpful after intense cardio. Minimum=0.00 Maximum=2.00 Default=0.20
        crouchReduceSpeedBuff = 0.2,
        -- ex. 0.9 means reduces incoming damage by 90% when armor is maxed; applies to armor Minimum=0.00 Maximum=1.00 Default=0.80
        maxDefenseReduction = 0.8,
        -- If dealt headshot, increase chance of wounding head. (ex. 20 means percentage of wounding head is 30% (20 + 10)) Minimum=0.00 Maximum=100.00 Default=20.00
        headShotIncChance = 20.0,
        -- If dealt footshot, increase chance of wounding legs/groin. (ex. 10 means percentage of wounding foot is 20% (10 + 10)) Minimum=0.00 Maximum=100.00 Default=10.00
        footShotIncChance = 10.0,
        -- Multiplier on base damage for headshot Minimum=0.00 Maximum=100.00 Default=10.00
        headShotDmgZomMultiplier = 10.0,
        -- Multiplier on base damage for bodyshot Minimum=0.00 Maximum=100.00 Default=5.00
        bodyShotDmgZomMultiplier = 5.0,
        -- Multiplier on base damage for footshot Minimum=0.00 Maximum=100.00 Default=1.00
        footShotDmgZomMultiplier = 1.0,
        -- Multiplier on base damage for headshot Minimum=0.00 Maximum=100.00 Default=15.00
        headShotDmgPlayerMultiplier = 15.0,
        -- Multiplier on base damage for bodyshot Minimum=0.00 Maximum=100.00 Default=5.00
        bodyShotDmgPlayerMultiplier = 5.0,
        -- Multiplier on base damage for footshot Minimum=0.00 Maximum=100.00 Default=2.00
        footShotDmgPlayerMultiplier = 2.0,
        -- Bloom affects crit chance. This is a multiplier to that. Set to 0 for better chances of crit. Minimum=0.00 Maximum=100.00 Default=1.00
        critChanceModifier = 1.0,
        -- Chance that a gunshot wound will cause a fracture Minimum=0.00 Maximum=100.00 Default=10.00
        fractureChance = 10.0,
        -- Chance that a gunshot wound will not inflict a lodged bullet Minimum=0.00 Maximum=100.00 Default=25.00
        throughChance = 25.0,
        -- Shotgun has a max independent projectile cone. Minimum=0.00 Maximum=1.00 Default=0.20
        maxShotgunProjCone = 0.4,
        -- Multiplier on base stat (range) of shotgun. Default value is 0.75 which means 75% of vanilla's range. Minimum=0.00 Maximum=10.00 Default=0.50
        shotgunDistanceModifier = 0.6,
        -- Amount of pellots shot Minimum=0 Maximum=100 Default=5
        shotgunnum = 6,
        -- Value affects shotgun spread. The lower the value, the more narrow the spread. Minimum=0.00 Maximum=1.00 Default=0.10
        shotgundivision = 0.1,
        -- Minimum=0.00 Maximum=100.00 Default=1.00
        shotgunDamageMultiplier = 1.0,
        -- Shotguns crit chance is only affected by their stat and aiming level (not bloom). Default value is 10 meaning the game decides a random value from 1 to (100 - 10) and if value is <= crit stat, then crit. Minimum=0.00 Maximum=100.00 Default=10.00
        critChanceModifierShotgunsOnly = 25.0,
        -- Minimum=0.00 Maximum=5.00 Default=0.00
        staminaCrouchScale = 0.001,
        -- Multiplier that scales off of heavy moodle level Minimum=0.00 Maximum=5.00 Default=0.50
        staminaHeavyCrouchScale = 0.5,
        -- Minimum=0.00 Maximum=5.00 Default=0.00
        staminaCrawlScale = 0.003,
        -- Multiplier that scales off of heavy moodle level Minimum=0.00 Maximum=5.00 Default=0.50
        staminaHeavyCrawlScale = 0.5,
        -- This value adds more bloom when walking or turning (Heavy Moodle Scaling) Minimum=0.00 Maximum=5.00 Default=0.50
        heavyTurnEffectModifier = 0.5,
        -- This value amplifies move and turning effect, which means more bloom when performing those actions. Set to 0 to disable. Minimum=0.00 Maximum=100.00 Default=0.50
        drunkActionEffectModifier = 0.5,
        -- Multiplier that increases your maxaimnum or max bloom. Set to 0 to disable. Minimum=0.00 Maximum=100.00 Default=6.00
        drunkMaxBloomModifier = 6.0,
        -- This value increases max bloom limit dpeending on heavy moodle level. Minimum=0.00 Maximum=100.00 Default=6.00
        heavyMaxBloomModifier = 6.0,
        -- Multiplier that affects how slow your crosshair reduces bloom. Minimum=0.50 Maximum=2.00 Default=0.66
        hyperHypoModifier = 0.66,
        -- Multiplier that affects how slow your crosshair reduces bloom. Minimum=0.50 Maximum=2.00 Default=0.50
        tiredModifier = 0.5,
        -- This value must be very small as it affects how slow your crosshair reduces bloom. Minimum=0.00 Maximum=1.00 Default=0.10
        painModifier = 0.1,
        -- Makes crosshair shaky. Minimum=0.00 Maximum=100.00 Default=2.00
        painVisualModifier = 2.0,
        -- Multiplier that determines how much panic increases the penalty affect when aiming at farther targets. Minimum=0.00 Maximum=5.00 Default=3.00
        panicPenaltyModifier = 3.0,
        -- Makes crosshair shaky. Minimum=0.00 Maximum=100.00 Default=1.00
        panicVisualModifier = 1.0,
        -- Multiplier that affects how much is added to minaimnum or minimum bloom. Minimum=0.00 Maximum=100.00 Default=4.00
        stressBloomModifier = 4.0,
        -- Affects how intense the crosshair shaking affect is. Set to 0 to disable. Minimum=0.00 Maximum=100.00 Default=1.25
        stressVisualModifier = 1.25,
        -- Value affects how much bloom is added when coughing. Minimum=0.00 Maximum=100.00 Default=2.00
        coughModifier = 2.0,
        -- Value affects the rate of bloom added when inhaling. Set to 0 to disable the whole endurance mechanic. Minimum=0.00 Maximum=100.00 Default=1.50
        enduranceBreathModifier = 1.5,
        -- Value determines how long the characters inhales (adds bloom). Links to exhaleModifier1. Higher value means shorter timer, lower means longer. Minimum=0.00 Maximum=100.00 Default=3.00
        inhaleModifier1 = 3.0,
        -- Value determines how long the characters exhales (reduces bloom). Links to exhaleModifier1. Higher value means shorter timer, lower means longer. Minimum=0.00 Maximum=100.00 Default=2.00
        exhaleModifier1 = 2.0,
        -- Minimum=0.00 Maximum=100.00 Default=3.00
        inhaleModifier2 = 3.0,
        -- Minimum=0.00 Maximum=100.00 Default=3.66
        exhaleModifier2 = 3.66,
        -- Minimum=0.00 Maximum=100.00 Default=3.00
        inhaleModifier3 = 3.0,
        -- Minimum=0.00 Maximum=100.00 Default=4.00
        exhaleModifier3 = 4.0,
        -- Minimum=0.00 Maximum=100.00 Default=4.00
        inhaleModifier4 = 4.0,
        -- Minimum=0.00 Maximum=100.00 Default=7.00
        exhaleModifier4 = 7.0,
        enableOgCrosshair = false,
        -- Minimum=0.00 Maximum=1.00 Default=1.00
        crosshairMaxTransparency = 1.0,
        -- Linked to color when there is zero bloom on crosshair. Pick a color value from 0 to 255 and divide it by 255, must be from 0 to 1. Minimum=0.00 Maximum=1.00 Default=0.20
        crosshairRed = 0.0,
        -- Linked to color when there is zero bloom on crosshair. Pick a color value from 0 to 255 and divide it by 255, must be from 0 to 1. Minimum=0.00 Maximum=1.00 Default=1.00
        crosshairGreen = 1.0,
        -- Linked to color when there is zero bloom on crosshair. Pick a color value from 0 to 255 and divide it by 255, must be from 0 to 1. Minimum=0.00 Maximum=1.00 Default=0.20
        crosshairBlue = 0.98,
        -- Linked to crosshair color. Pick a color value from 0 to 255 and divide it by 255, must be from 0 to 1. Minimum=0.00 Maximum=1.00 Default=1.00
        crosshairRedMain = 1.0,
        -- Linked to crosshair color. Pick a color value from 0 to 255 and divide it by 255, must be from 0 to 1. Minimum=0.00 Maximum=1.00 Default=1.00
        crosshairGreenMain = 1.0,
        -- Linked to crosshair color. Pick a color value from 0 to 255 and divide it by 255, must be from 0 to 1. Minimum=0.00 Maximum=1.00 Default=1.00
        crosshairBlueMain = 1.0,
        -- Linked to color when crosshair is out of range. Pick a color value from 0 to 255 and divide it by 255, must be from 0 to 1. Minimum=0.00 Maximum=1.00 Default=1.00
        crosshairRedLimit = 1.0,
        -- Linked to color when crosshair is out of range. Pick a color value from 0 to 255 and divide it by 255, must be from 0 to 1. Minimum=0.00 Maximum=1.00 Default=1.00
        crosshairGreenLimit = 0.2,
        -- Linked to color when crosshair is out of range. Pick a color value from 0 to 255 and divide it by 255, must be from 0 to 1. Minimum=0.00 Maximum=1.00 Default=0.00
        crosshairBlueLimit = 0.0,
    },
    KATTAJ1 = {
        -- Does Nothing. Just name of category that separates categories
        Category1 = false,
        -- Specifies the probability of encountering Zombies in Black Patriot Gear at Military Bases Minimum=0.00 Maximum=100.00 Default=1.00
        BlackGearedZombiesPatriotArmy = 0.6,
        -- Specifies the probability of encountering Zombies in Black Defender Gear at Military Bases Minimum=0.00 Maximum=100.00 Default=0.80
        BlackGearedZombiesDefenderArmy = 0.3,
        -- Specifies the probability of encountering Zombies in Black Vanguard Gear at Military Bases Minimum=0.00 Maximum=100.00 Default=0.40
        BlackGearedZombiesVanguardArmy = 0.1,
        -- Does Nothing. Just separates categories
        EmptyLine11 = false,
        -- Specifies the probability of encountering Zombies in Desert Patriot Gear at Military Bases Minimum=0.00 Maximum=100.00 Default=2.00
        DesertGearedZombiesPatriotArmy = 0.6,
        -- Specifies the probability of encountering Zombies in Desert Defender Gear at Military Bases Minimum=0.00 Maximum=100.00 Default=1.00
        DesertGearedZombiesDefenderArmy = 0.3,
        -- Specifies the probability of encountering Zombies in Desert Vanguard Gear at Military Bases Minimum=0.00 Maximum=100.00 Default=0.50
        DesertGearedZombiesVanguardArmy = 0.1,
        -- Does Nothing. Just separates categories
        EmptyLine12 = false,
        -- Specifies the probability of encountering Zombies in Green Patriot Gear at Military Bases Minimum=0.00 Maximum=100.00 Default=4.00
        GreenGearedZombiesPatriotArmy = 1.0,
        -- Specifies the probability of encountering Zombies in Green Defender Gear at Military Bases Minimum=0.00 Maximum=100.00 Default=2.00
        GreenGearedZombiesDefenderArmy = 0.6,
        -- Specifies the probability of encountering Zombies in Green Vanguard Gear at Military Bases Minimum=0.00 Maximum=100.00 Default=1.00
        GreenGearedZombiesVanguardArmy = 0.1,
        -- Does Nothing. Just separates categories
        EmptyLine13 = false,
        -- Specifies the probability of encountering Zombies in White Patriot Gear at Military Bases Minimum=0.00 Maximum=100.00 Default=1.00
        WhiteGearedZombiesPatriotArmy = 0.6,
        -- Specifies the probability of encountering Zombies in White Defender Gear at Military Bases Minimum=0.00 Maximum=100.00 Default=0.80
        WhiteGearedZombiesDefenderArmy = 0.3,
        -- Specifies the probability of encountering Zombies in White Vanguard Gear at Military Bases Minimum=0.00 Maximum=100.00 Default=0.40
        WhiteGearedZombiesVanguardArmy = 0.1,
        -- Does Nothing. Just separates categories
        EmptyLine9 = false,
        -- Does Nothing. Just name of category that separates categories
        Category9 = false,
        -- Defines spawn chances for Zombies in Black Patriot Gear at Default Zones. This setting determines whether KATTAJ1 Zeds can be encountered in cities, forests, or essentially any location where regular zombies can be found. Minimum=0.00 Maximum=100.00 Default=0.08
        BlackGearedZombiesPatriotDefault = 0.0,
        -- Defines spawn chances for Zombies in Black Defender Gear at Default Zones. This setting determines whether KATTAJ1 Zeds can be encountered in cities, forests, or essentially any location where regular zombies can be found. Minimum=0.00 Maximum=100.00 Default=0.06
        BlackGearedZombiesDefenderDefault = 0.0,
        -- Defines spawn chances for Zombies in Black Vanguard Gear at Default Zones. This setting determines whether KATTAJ1 Zeds can be encountered in cities, forests, or essentially any location where regular zombies can be found. Minimum=0.00 Maximum=100.00 Default=0.04
        BlackGearedZombiesVanguardDefault = 0.0,
        -- Does Nothing. Just separates categories
        EmptyLine14 = false,
        -- Defines spawn chances for Zombies in Desert Patriot Gear at Default Zones. This setting determines whether KATTAJ1 Zeds can be encountered in cities, forests, or essentially any location where regular zombies can be found. Minimum=0.00 Maximum=100.00 Default=0.20
        DesertGearedZombiesPatriotDefault = 0.0,
        -- Defines spawn chances for Zombies in Desert Defender Gear at Default Zones. This setting determines whether KATTAJ1 Zeds can be encountered in cities, forests, or essentially any location where regular zombies can be found. Minimum=0.00 Maximum=100.00 Default=0.10
        DesertGearedZombiesDefenderDefault = 0.0,
        -- Defines spawn chances for Zombies in Desert Vanguard Gear at Default Zones. This setting determines whether KATTAJ1 Zeds can be encountered in cities, forests, or essentially any location where regular zombies can be found. Minimum=0.00 Maximum=100.00 Default=0.05
        DesertGearedZombiesVanguardDefault = 0.0,
        -- Does Nothing. Just separates categories
        EmptyLine15 = false,
        -- Defines spawn chances for Zombies in Green Patriot Gear at Default Zones. This setting determines whether KATTAJ1 Zeds can be encountered in cities, forests, or essentially any location where regular zombies can be found. Minimum=0.00 Maximum=100.00 Default=0.10
        GreenGearedZombiesPatriotDefault = 0.0,
        -- Defines spawn chances for Zombies in Green Defender Gear at Default Zones. This setting determines whether KATTAJ1 Zeds can be encountered in cities, forests, or essentially any location where regular zombies can be found. Minimum=0.00 Maximum=100.00 Default=0.08
        GreenGearedZombiesDefenderDefault = 0.0,
        -- Defines spawn chances for Zombies in Green Vanguard Gear at Default Zones. This setting determines whether KATTAJ1 Zeds can be encountered in cities, forests, or essentially any location where regular zombies can be found. Minimum=0.00 Maximum=100.00 Default=0.06
        GreenGearedZombiesVanguardDefault = 0.0,
        -- Does Nothing. Just separates categories
        EmptyLine16 = false,
        -- Defines spawn chances for Zombies in White Patriot Gear at Default Zones. This setting determines whether KATTAJ1 Zeds can be encountered in cities, forests, or essentially any location where regular zombies can be found. Minimum=0.00 Maximum=100.00 Default=0.06
        WhiteGearedZombiesPatriotDefault = 0.0,
        -- Defines spawn chances for Zombies in White Defender Gear at Default Zones. This setting determines whether KATTAJ1 Zeds can be encountered in cities, forests, or essentially any location where regular zombies can be found. Minimum=0.00 Maximum=100.00 Default=0.05
        WhiteGearedZombiesDefenderDefault = 0.0,
        -- Defines spawn chances for Zombies in White Vanguard Gear at Default Zones. This setting determines whether KATTAJ1 Zeds can be encountered in cities, forests, or essentially any location where regular zombies can be found. Minimum=0.00 Maximum=100.00 Default=0.04
        WhiteGearedZombiesVanguardDefault = 0.0,
        -- Does Nothing. Just separates categories
        EmptyLine10 = false,
        -- Does Nothing. Just name of category that separates categories
        Category10 = false,
        -- Defines spawn chances for Zombies in Black Patriot Gear at Secret Base Minimum=0.00 Maximum=100.00 Default=3.00
        BlackGearedZombiesPatriotSecretBase = 3.0,
        -- Defines spawn chances for Zombies in Black Defender Gear at Secret Base Minimum=0.00 Maximum=100.00 Default=4.00
        BlackGearedZombiesDefenderSecretBase = 4.0,
        -- Defines spawn chances for Zombies in Black Vanguard Gear at Secret Base Minimum=0.00 Maximum=100.00 Default=2.00
        BlackGearedZombiesVanguardSecretBase = 2.0,
        -- Does Nothing. Just separates categories
        EmptyLine17 = false,
        -- Defines spawn chances for Zombies in Desert Patriot Gear at Secret Base Minimum=0.00 Maximum=100.00 Default=0.20
        DesertGearedZombiesPatriotSecretBase = 0.2,
        -- Defines spawn chances for Zombies in Desert Defender Gear at Secret Base Minimum=0.00 Maximum=100.00 Default=0.40
        DesertGearedZombiesDefenderSecretBase = 0.4,
        -- Defines spawn chances for Zombies in Desert Vanguard Gear at Secret Base Minimum=0.00 Maximum=100.00 Default=0.60
        DesertGearedZombiesVanguardSecretBase = 0.6,
        -- Does Nothing. Just separates categories
        EmptyLine18 = false,
        -- Defines spawn chances for Zombies in Green Patriot Gear at Secret Base Minimum=0.00 Maximum=100.00 Default=0.60
        GreenGearedZombiesPatriotSecretBase = 0.6,
        -- Defines spawn chances for Zombies in Green Defender Gear at Secret Base Minimum=0.00 Maximum=100.00 Default=0.80
        GreenGearedZombiesDefenderSecretBase = 0.8,
        -- Defines spawn chances for Zombies in Green Vanguard Gear at Secret Base Minimum=0.00 Maximum=100.00 Default=1.00
        GreenGearedZombiesVanguardSecretBase = 1.0,
        -- Does Nothing. Just separates categories
        EmptyLine19 = false,
        -- Defines spawn chances for Zombies in White Patriot Gear at Secret Base Minimum=0.00 Maximum=100.00 Default=0.80
        WhiteGearedZombiesPatriotSecretBase = 0.8,
        -- Defines spawn chances for Zombies in White Defender Gear at Secret Base Minimum=0.00 Maximum=100.00 Default=1.00
        WhiteGearedZombiesDefenderSecretBase = 1.0,
        -- Defines spawn chances for Zombies in White Vanguard Gear at Secret Base Minimum=0.00 Maximum=100.00 Default=2.00
        WhiteGearedZombiesVanguardSecretBase = 2.0,
        -- Does Nothing. Just separates categories
        EmptyLine2 = false,
        -- Does Nothing. Just name of category that separates categories
        Category2 = false,
        -- <IMAGE:media/textures/Item_Military_Helmet_Patriot-BlackPlain.png><IMAGE:media/textures/Item_Military_Helmet_Patriot-Black.png><LINE>
        EnableBlackGearLoot = false,
        -- <IMAGE:media/textures/Item_Military_Helmet_Patriot-DesertPlain.png><IMAGE:media/textures/Item_Military_Helmet_Patriot-Desert.png><LINE>
        EnableDesertGearLoot = false,
        -- <IMAGE:media/textures/Item_Military_Helmet_Patriot-GreenPlain.png><IMAGE:media/textures/Item_Military_Helmet_Patriot-Green.png><LINE>
        EnableGreenGearLoot = false,
        -- <IMAGE:media/textures/Item_Military_Helmet_Patriot-WhitePlain.png><IMAGE:media/textures/Item_Military_Helmet_Patriot-White.png><LINE>
        EnableWhiteGearLoot = false,
        -- <IMAGE:media/textures/Item_Military_Helmet_Patriot-Press.png><LINE>
        EnablePressGearLoot = true,
        -- Does Nothing. Just separates categories
        EmptyLine3 = false,
        -- Does Nothing. Just name of category that separates categories
        Category3 = false,
        -- <IMAGE:media/textures/Item_Military_Helmet_Patriot-WhitePlain.png> <LINE> Defines spawn chances for Patriot gear: helmet, arms upper protection, arms, lower protection, bulletproof vest, legs upper protection, legs lower potection in containers Minimum=0.00 Maximum=100.00 Default=0.03
        PatriotGear = 0.01,
        -- <IMAGE:media/textures/Item_Military_Helmet_Defender-WhitePlain.png> <LINE> Defines spawn chances for Defender gear: helmet, arms upper protection, arms, lower protection, bulletproof vest, legs upper protection, legs lower potection in containers Minimum=0.00 Maximum=100.00 Default=0.02
        DefenderGear = 0.008,
        -- <IMAGE:media/textures/Item_Military_FullHelmet_Vanguard-WhitePlain.png> <LINE> Defines spawn chances for Vanguard gear: helmet, arms upper protection, arms, lower protection, bulletproof vest, legs upper protection, legs lower potection in containers Minimum=0.00 Maximum=100.00 Default=0.01
        VanguardGear = 0.002,
        -- Does Nothing. Just separates categories
        EmptyLine4 = false,
        -- Does Nothing. Just name of category that separates categories
        Category4 = false,
        -- <IMAGE:media/textures/Item_Military_Backpack_Pocket_Small-WhitePlain.png> <LINE> Defines spawn chances for Pocket backpack in containers Minimum=0.00 Maximum=100.00 Default=0.05
        PocketBackpack = 0.05,
        -- <IMAGE:media/textures/Item_Military_Backpack_Strategist_Medium-WhitePlain.png> <LINE> Defines spawn chances for Strategist backpack in containers Minimum=0.00 Maximum=100.00 Default=0.03
        StrategistBackpack = 0.025,
        -- <IMAGE:media/textures/Item_Military_Backpack_Ranger_Large-WhitePlain.png> <LINE> Defines spawn chances for Ranger backpack in containers Minimum=0.00 Maximum=100.00 Default=0.01
        RangerBackpack = 0.0125,
        -- <IMAGE:media/textures/Item_Military_Backpack_Colossus_VeryLarge-WhitePlain.png> <LINE> Defines spawn chances for Colossus backpack in containers. 2.5E-4 = 0.00025. Feel free to put here number bigger or lower without using E Minimum=0.00 Maximum=100.00 Default=0.00
        ColossusBackpack = 2.5E-4,
        -- <IMAGE:media/textures/Item_Military_Backpack_Echo_Radio-WhitePlain.png> <LINE> Defines spawn chances for Echo backpack in containers Minimum=0.00 Maximum=100.00 Default=0.01
        EchoBackpack = 0.0125,
        -- Does Nothing. Just separates categories
        EmptyLine5 = false,
        -- Does Nothing. Just name of category that separates categories
        Category5 = false,
        -- Defines spawn chances for small stormpack in containers Minimum=0.00 Maximum=100.00 Default=0.03
        StormPackSmall = 0.03,
        -- Defines spawn chances for medium stormpack in containers Minimum=0.00 Maximum=100.00 Default=0.02
        StormPackMedium = 0.015,
        -- Defines spawn chances for large stormpack in containers Minimum=0.00 Maximum=100.00 Default=0.01
        StormPackLarge = 0.005,
        -- Does Nothing. Just separates categories
        EmptyLine6 = false,
        -- Does Nothing. Just name of category that separates categories
        Category6 = false,
        -- <LINE> Defines spawn chances for small military chest pouches in containers Minimum=0.00 Maximum=100.00 Default=0.03
        PouchesSmall = 0.03,
        -- <LINE> Defines spawn chances for medium military chest pouches in containers Minimum=0.00 Maximum=100.00 Default=0.02
        PouchesMedium = 0.015,
        -- Defines spawn chances for large military chest pouches in containers Minimum=0.00 Maximum=100.00 Default=0.01
        PouchesLarge = 0.005,
        -- Does Nothing. Just separates categories
        EmptyLine7 = false,
        -- Does Nothing. Just name of category that separates categories
        Category7 = false,
        -- Defines spawn chances for small magsecure hip pouch in containers Minimum=0.00 Maximum=100.00 Default=0.03
        HipBagSmall = 0.03,
        -- Defines spawn chances for medium utility hip pouch in containers Minimum=0.00 Maximum=100.00 Default=0.02
        HipBagMedium = 0.015,
        -- Does Nothing. Just separates categories
        EmptyLine8 = false,
        -- Does Nothing. Just name of category that separates categories
        Category8 = false,
        -- Defines spawn chances for holsters / sheaths in containers Minimum=0.00 Maximum=100.00 Default=0.04
        HolsterSheath = 0.04,
        -- Defines spawn chances for glasses, gas masks, headsets, berets, caps in containers Minimum=0.00 Maximum=100.00 Default=0.04
        HeadApparel = 0.04,
        -- Defines spawn chances for balaclavas and bandana in containers Minimum=0.00 Maximum=100.00 Default=0.02
        Balaclava = 0.02,
        -- Defines spawn chances for jacket, lightweight jacket, winter jacket in containers Minimum=0.00 Maximum=100.00 Default=0.04
        Jacket = 0.04,
        -- Defines spawn chances for gloves, fingerless gloves in containers Minimum=0.00 Maximum=100.00 Default=0.04
        Gloves = 0.04,
        -- Defines spawn chances for classic / short sleeve / tank top / tank top short / long sleeve / long sleeve short / long sleeve short / sleeveless / sleeveless shirt and T-shirt in containers Minimum=0.00 Maximum=100.00 Default=0.02
        MilitaryTShirts = 0.02,
        -- Defines spawn chances classic, cargo, capri pants and cargo / knee length shorts in containers Minimum=0.00 Maximum=100.00 Default=0.02
        PantsShorts = 0.02,
        -- Defines spawn chances for boots, tactical boots in containers Minimum=0.00 Maximum=100.00 Default=0.04
        BootsShoes = 0.04,
        -- Defines spawn chances for thermal underwear in containers Minimum=0.00 Maximum=100.00 Default=0.04
        ThermalUnderwear = 0.04,
        -- Defines spawn chances for non military apparel in store containers. Includes one shoulder, one shoulder short, neckholder, neckholder short shirts; stockings, skirts, short and skinny shorts. Does not spawn at military bases Minimum=0.00 Maximum=100.00 Default=0.04
        NonMilitary = 0.04,
    },
    zReSA = {
        -- The recommended number is no lower than the default value.
        --  Zero value disable spawn.
        --  Common zombies range from 2000+.
        --  For example, the golfer zombie (quite rare) has 2000 weight and the park ranger 10000. Minimum=0 Maximum=30000 Default=50
        SpawnChanceSWAT = 200,
    },
    IMNAL = {
        -- Minimum=0 Maximum=100 Default=30
        CarLighterChance = 30,
        -- Minimum=0 Maximum=100 Default=50
        CarLighterSocketChance = 50,
        -- Minimum=0 Maximum=10 Default=1
        electricityReq = 1,
        -- Minimum=0 Maximum=10 Default=2
        mechanicReq = 2,
        -- Minimum=1 Maximum=9999 Default=460
        stoveSmokingLength = 460,
        -- Minimum=1 Maximum=9999 Default=460
        carSmokingLength = 460,
        allowStove = true,
        allowMicrowave = false,
        allowFireplace = true,
        allowCampfire = true,
        allowFire = true,
        allowBump = true,
        noStoveRisk = true,
        -- Minimum=0 Maximum=400 Default=200
        carLighterBaseTimer = 200,
        -- Minimum=0 Maximum=300 Default=150
        stoveBaseTimer = 150,
        -- Minimum=0 Maximum=2000 Default=1000
        microwaveBaseTimer = 1000,
        -- Minimum=0 Maximum=200 Default=100
        fireplaceBaseTimer = 100,
        -- Minimum=0 Maximum=200 Default=100
        barbecueBaseTimer = 100,
        -- Minimum=0 Maximum=240 Default=120
        campingBaseTimer = 120,
        -- Minimum=0 Maximum=80 Default=40
        fireBaseTimer = 40,
        -- Minimum=0 Maximum=20 Default=10
        playerBaseTimer = 10,
    },
    ScreecherZ = {
        DayOnly = false,
        NightOnly = false,
        -- The chance in percentage that a sprinter will screech when hunting a Player.  Minimum=1 Maximum=100 Default=100
        ScreechChance = 100,
        -- Determines the frequency that the mod's code will run.
        -- Higher = Better performance but less reliability.  Minimum=1 Maximum=36000 Default=15
        TickRate = 15,
        -- Determines whether ScreecherZ will attract nearby zombies with their screech. 
        AlertNearbyZombies = false,
        -- Determines the square area in which a screech attracts zombies.  Minimum=0 Maximum=300 Default=21
        AlertRadius = 21,
    },
    TrafficLine = {
        -- Require paint when drawing Traffic line
        NeedPaint = true,
        -- Require petrol when erasing Traffic line
        NeedPetrol = false,
    },
    ObviousCollecting = {
        -- If enabled, Players won't receive any items from picking up obvious stuff. 
        DisableLoot = false,
        -- Multiplies the amount of items received (If any) by Players when they pick up obvious stuff.  Minimum=0.00 Maximum=100.00 Default=1.00
        LootMultiplier = 0.5,
    },
    ReadWalking = {
        -- The darkness of the reading fog. 0.0 means no darkness. 1.0 means full darkness. Minimum=0.00 Maximum=1.00 Default=1.00
        FogDarkness = 1.0,
        -- The mod: Read While Walking 1.0 means x1 vanilla defaults. 2.0 means speed x2, etc. Minimum=0.20 Maximum=100.00 Default=1.00
        ReadSpeed = 1.2,
    },
    RewardingNightCombat = {
        -- In the upper right there will be a moon icon indicating whether the bonuses are active or not.
        enableIndicator = true,
        draggableIndicator = true,
        -- Default=Dark Cyan - Lime Green
        -- 1 = Original
        -- 2 = Bright Orange
        -- 3 = Crimson
        -- 4 = Cyan
        -- 5 = Toxic Green
        indicatorColor = 6,
        -- Suspenseful sound that plays when the Rewarding Night Combat event is triggered.
        enableTriggerSound = false,
        -- Probability that Rewarding Night Combat event is triggered. Value 100 means that event will trigger every day. Minimum=0 Maximum=100 Default=100
        triggerProbability = 100,
        -- The day the event will start triggering. Minimum=0 Maximum=365 Default=0
        startAfterXDays = 0,
        -- The time when players will start receiving bonuses during the summer Default=11 PM / 23:00
        -- 1 = 12 AM / 00:00
        -- 2 = 1 AM / 01:00
        -- 3 = 2 AM / 02:00
        -- 4 = 3 AM / 03:00
        -- 5 = 4 AM / 04:00
        -- 6 = 5 AM / 05:00
        -- 7 = 6 AM / 06:00
        -- 8 = 7 AM / 07:00
        -- 9 = 8 AM / 08:00
        -- 10 = 9 AM / 09:00
        -- 11 = 10 AM / 10:00
        -- 12 = 11 AM / 11:00
        -- 13 = 12 PM / 12:00
        -- 14 = 1 PM / 13:00
        -- 15 = 2 PM / 14:00
        -- 16 = 3 PM / 15:00
        -- 17 = 4 PM / 16:00
        -- 18 = 5 PM / 17:00
        -- 19 = 6 PM / 18:00
        -- 20 = 7 PM / 19:00
        -- 21 = 8 PM / 20:00
        -- 22 = 9 PM / 21:00
        -- 23 = 10 PM / 22:00
        startTimeSummer = 24,
        -- The time when players will stop receiving bonuses during the summer Default=6 AM / 06:00
        -- 1 = 12 AM / 00:00
        -- 2 = 1 AM / 01:00
        -- 3 = 2 AM / 02:00
        -- 4 = 3 AM / 03:00
        -- 5 = 4 AM / 04:00
        -- 6 = 5 AM / 05:00
        -- 7 = 6 AM / 06:00
        -- 8 = 7 AM / 07:00
        -- 9 = 8 AM / 08:00
        -- 10 = 9 AM / 09:00
        -- 11 = 10 AM / 10:00
        -- 12 = 11 AM / 11:00
        -- 13 = 12 PM / 12:00
        -- 14 = 1 PM / 13:00
        -- 15 = 2 PM / 14:00
        -- 16 = 3 PM / 15:00
        -- 17 = 4 PM / 16:00
        -- 18 = 5 PM / 17:00
        -- 19 = 6 PM / 18:00
        -- 20 = 7 PM / 19:00
        -- 21 = 8 PM / 20:00
        -- 22 = 9 PM / 21:00
        -- 23 = 10 PM / 22:00
        endTimeSummer = 7,
        -- The time when players will start receiving bonuses during the autumn Default=11 PM / 23:00
        -- 1 = 12 AM / 00:00
        -- 2 = 1 AM / 01:00
        -- 3 = 2 AM / 02:00
        -- 4 = 3 AM / 03:00
        -- 5 = 4 AM / 04:00
        -- 6 = 5 AM / 05:00
        -- 7 = 6 AM / 06:00
        -- 8 = 7 AM / 07:00
        -- 9 = 8 AM / 08:00
        -- 10 = 9 AM / 09:00
        -- 11 = 10 AM / 10:00
        -- 12 = 11 AM / 11:00
        -- 13 = 12 PM / 12:00
        -- 14 = 1 PM / 13:00
        -- 15 = 2 PM / 14:00
        -- 16 = 3 PM / 15:00
        -- 17 = 4 PM / 16:00
        -- 18 = 5 PM / 17:00
        -- 19 = 6 PM / 18:00
        -- 20 = 7 PM / 19:00
        -- 21 = 8 PM / 20:00
        -- 22 = 9 PM / 21:00
        -- 23 = 10 PM / 22:00
        startTimeAutumn = 24,
        -- The time when players will stop receiving bonuses during the autumn Default=6 AM / 06:00
        -- 1 = 12 AM / 00:00
        -- 2 = 1 AM / 01:00
        -- 3 = 2 AM / 02:00
        -- 4 = 3 AM / 03:00
        -- 5 = 4 AM / 04:00
        -- 6 = 5 AM / 05:00
        -- 7 = 6 AM / 06:00
        -- 8 = 7 AM / 07:00
        -- 9 = 8 AM / 08:00
        -- 10 = 9 AM / 09:00
        -- 11 = 10 AM / 10:00
        -- 12 = 11 AM / 11:00
        -- 13 = 12 PM / 12:00
        -- 14 = 1 PM / 13:00
        -- 15 = 2 PM / 14:00
        -- 16 = 3 PM / 15:00
        -- 17 = 4 PM / 16:00
        -- 18 = 5 PM / 17:00
        -- 19 = 6 PM / 18:00
        -- 20 = 7 PM / 19:00
        -- 21 = 8 PM / 20:00
        -- 22 = 9 PM / 21:00
        -- 23 = 10 PM / 22:00
        endTimeAutumn = 7,
        -- The time when players will start receiving bonuses during the winter Default=11 PM / 23:00
        -- 1 = 12 AM / 00:00
        -- 2 = 1 AM / 01:00
        -- 3 = 2 AM / 02:00
        -- 4 = 3 AM / 03:00
        -- 5 = 4 AM / 04:00
        -- 6 = 5 AM / 05:00
        -- 7 = 6 AM / 06:00
        -- 8 = 7 AM / 07:00
        -- 9 = 8 AM / 08:00
        -- 10 = 9 AM / 09:00
        -- 11 = 10 AM / 10:00
        -- 12 = 11 AM / 11:00
        -- 13 = 12 PM / 12:00
        -- 14 = 1 PM / 13:00
        -- 15 = 2 PM / 14:00
        -- 16 = 3 PM / 15:00
        -- 17 = 4 PM / 16:00
        -- 18 = 5 PM / 17:00
        -- 19 = 6 PM / 18:00
        -- 20 = 7 PM / 19:00
        -- 21 = 8 PM / 20:00
        -- 22 = 9 PM / 21:00
        -- 23 = 10 PM / 22:00
        startTimeWinter = 24,
        -- The time when players will stop receiving bonuses during the winter Default=6 AM / 06:00
        -- 1 = 12 AM / 00:00
        -- 2 = 1 AM / 01:00
        -- 3 = 2 AM / 02:00
        -- 4 = 3 AM / 03:00
        -- 5 = 4 AM / 04:00
        -- 6 = 5 AM / 05:00
        -- 7 = 6 AM / 06:00
        -- 8 = 7 AM / 07:00
        -- 9 = 8 AM / 08:00
        -- 10 = 9 AM / 09:00
        -- 11 = 10 AM / 10:00
        -- 12 = 11 AM / 11:00
        -- 13 = 12 PM / 12:00
        -- 14 = 1 PM / 13:00
        -- 15 = 2 PM / 14:00
        -- 16 = 3 PM / 15:00
        -- 17 = 4 PM / 16:00
        -- 18 = 5 PM / 17:00
        -- 19 = 6 PM / 18:00
        -- 20 = 7 PM / 19:00
        -- 21 = 8 PM / 20:00
        -- 22 = 9 PM / 21:00
        -- 23 = 10 PM / 22:00
        endTimeWinter = 7,
        -- The time when players will start receiving bonuses during the spring Default=11 PM / 23:00
        -- 1 = 12 AM / 00:00
        -- 2 = 1 AM / 01:00
        -- 3 = 2 AM / 02:00
        -- 4 = 3 AM / 03:00
        -- 5 = 4 AM / 04:00
        -- 6 = 5 AM / 05:00
        -- 7 = 6 AM / 06:00
        -- 8 = 7 AM / 07:00
        -- 9 = 8 AM / 08:00
        -- 10 = 9 AM / 09:00
        -- 11 = 10 AM / 10:00
        -- 12 = 11 AM / 11:00
        -- 13 = 12 PM / 12:00
        -- 14 = 1 PM / 13:00
        -- 15 = 2 PM / 14:00
        -- 16 = 3 PM / 15:00
        -- 17 = 4 PM / 16:00
        -- 18 = 5 PM / 17:00
        -- 19 = 6 PM / 18:00
        -- 20 = 7 PM / 19:00
        -- 21 = 8 PM / 20:00
        -- 22 = 9 PM / 21:00
        -- 23 = 10 PM / 22:00
        startTimeSpring = 24,
        -- The time when players will stop receiving bonuses during the spring Default=6 AM / 06:00
        -- 1 = 12 AM / 00:00
        -- 2 = 1 AM / 01:00
        -- 3 = 2 AM / 02:00
        -- 4 = 3 AM / 03:00
        -- 5 = 4 AM / 04:00
        -- 6 = 5 AM / 05:00
        -- 7 = 6 AM / 06:00
        -- 8 = 7 AM / 07:00
        -- 9 = 8 AM / 08:00
        -- 10 = 9 AM / 09:00
        -- 11 = 10 AM / 10:00
        -- 12 = 11 AM / 11:00
        -- 13 = 12 PM / 12:00
        -- 14 = 1 PM / 13:00
        -- 15 = 2 PM / 14:00
        -- 16 = 3 PM / 15:00
        -- 17 = 4 PM / 16:00
        -- 18 = 5 PM / 17:00
        -- 19 = 6 PM / 18:00
        -- 20 = 7 PM / 19:00
        -- 21 = 8 PM / 20:00
        -- 22 = 9 PM / 21:00
        -- 23 = 10 PM / 22:00
        endTimeSpring = 7,
        -- Bonus XP multiplier for axes when used throughout the night. Vanilla means no bonus, whereas, for example, 1.5x gives 50% bonus. Default=1.5x
        -- 1 = Vanilla
        -- 2 = 1.1x
        -- 3 = 1.15x
        -- 4 = 1.25x
        -- 5 = 1.5x
        -- 6 = 1.75x
        -- 7 = 2x
        -- 8 = 2.5x
        -- 9 = 3x
        -- 10 = 4x
        -- 11 = 5x
        -- 12 = 7.5x
        axeBonusMultiplier = 5,
        -- Bonus XP multiplier for long blunt weapons when used throughout the night. Vanilla means no bonus, whereas, for example, 1.5x gives 50% bonus. Default=1.5x
        -- 1 = Vanilla
        -- 2 = 1.1x
        -- 3 = 1.15x
        -- 4 = 1.25x
        -- 5 = 1.5x
        -- 6 = 1.75x
        -- 7 = 2x
        -- 8 = 2.5x
        -- 9 = 3x
        -- 10 = 4x
        -- 11 = 5x
        -- 12 = 7.5x
        longBluntBonusMultiplier = 5,
        -- Bonus XP multiplier for short blunt weapons when used throughout the night. Vanilla means no bonus, whereas, for example, 1.5x gives 50% bonus. Default=1.75x
        -- 1 = Vanilla
        -- 2 = 1.1x
        -- 3 = 1.15x
        -- 4 = 1.25x
        -- 5 = 1.5x
        -- 6 = 1.75x
        -- 7 = 2x
        -- 8 = 2.5x
        -- 9 = 3x
        -- 10 = 4x
        -- 11 = 5x
        -- 12 = 7.5x
        shortBluntBonusMultiplier = 6,
        -- Bonus XP multiplier for long blades when used throughout the night. Vanilla means no bonus, whereas, for example, 1.5x gives 50% bonus. Default=1.5x
        -- 1 = Vanilla
        -- 2 = 1.1x
        -- 3 = 1.15x
        -- 4 = 1.25x
        -- 5 = 1.5x
        -- 6 = 1.75x
        -- 7 = 2x
        -- 8 = 2.5x
        -- 9 = 3x
        -- 10 = 4x
        -- 11 = 5x
        -- 12 = 7.5x
        longBladeBonusMultiplier = 5,
        -- Bonus XP multiplier for short blades when used throughout the night. Vanilla means no bonus, whereas, for example, 1.5x gives 50% bonus. Default=1.75x
        -- 1 = Vanilla
        -- 2 = 1.1x
        -- 3 = 1.15x
        -- 4 = 1.25x
        -- 5 = 1.5x
        -- 6 = 1.75x
        -- 7 = 2x
        -- 8 = 2.5x
        -- 9 = 3x
        -- 10 = 4x
        -- 11 = 5x
        -- 12 = 7.5x
        shortBladeBonusMultiplier = 6,
        -- Bonus XP multiplier for spears when used throughout the night. Vanilla means no bonus, whereas, for example, 1.5x gives 50% bonus. Default=1.5x
        -- 1 = Vanilla
        -- 2 = 1.1x
        -- 3 = 1.15x
        -- 4 = 1.25x
        -- 5 = 1.5x
        -- 6 = 1.75x
        -- 7 = 2x
        -- 8 = 2.5x
        -- 9 = 3x
        -- 10 = 4x
        -- 11 = 5x
        -- 12 = 7.5x
        spearBonusMultiplier = 5,
        -- When aiming level is 4 or higher, the game nerfs experience gains; if this option is true, bonus experiences will not be affected by the nerf.
        ignoreAimingXPNerf = false,
        -- Bonus XP multiplier for ranged weapons when used throughout the night. Vanilla means no bonus, whereas, for example, 1.5x gives 50% bonus. Default=1.5x
        -- 1 = Vanilla
        -- 2 = 1.1x
        -- 3 = 1.15x
        -- 4 = 1.25x
        -- 5 = 1.5x
        -- 6 = 1.75x
        -- 7 = 2x
        -- 8 = 2.5x
        -- 9 = 3x
        -- 10 = 4x
        -- 11 = 5x
        -- 12 = 7.5x
        aimingBonusMultiplier = 5,
    },
    DiveThruWindows = {
        -- X out of (100 + player skill/trait factor) will cause a heavy injury. 
        -- Rolled once when smashing a window while sprinting. Higher chance of shard injury and cannot hit below the groin. Player skill/trait factor is 95 for Graceful, max Running, max Nimble characters. Minimum=0 Maximum=200 Default=50
        DiveClosedWindowInjuryChance = 50,
        -- X out of (100 + player skill/trait factor) will cause an injury. 
        -- This is rolled twice when diving through a closed or already broken window. Cannot hit the neck. Player skill/trait factor is 140 for Graceful, max Nimble characters. Minimum=0 Maximum=200 Default=30
        DiveBrokenWindowInjuryChance = 30,
        -- Instead of X out of (100 + player skill/trait factor), change the 100 to something smaller to emphasize player skill or vice-versa. Minimum=0 Maximum=200 Default=100
        BaseDodge = 100,
        -- Multiplier for armor effectiveness against dive injuries. Minimum=0 Maximum=200 Default=100
        ArmorEffectiveness = 100,
        -- When smashing a window with a dive, this is the % chance that the animation will be converted to a failure. 
        -- Even when set to zero, the roll can happen as the vanilla roll for failure also takes place. Applies to dives even on open windows. Reduced by 40 for a max Nimble character. -20 from Graceful and +10 from Clumsy. Minimum=0 Maximum=200 Default=45
        BaseFailDiveChance = 45,
        -- Whether the injury from smashing the window can scratch/wound the legs. (Note that the legs can always be scratched from diving thru the smashed window)
        CanInjureLegs = false,
        -- How many bonus injury rolls occur upon smashing a window with a dive? Minimum=0 Maximum=9 Default=0
        ExtraInjuryRolls = 1,
    },
    MIR = {
        -- Will not add maintenance as a skill to repair recipes for these items. Uses item IDs, not their names. Separate them with ';' for example Axe; HandAxe
        SkipItems = "",
        -- Will not add maintenance as a skill to repair recipes that already have one of the specified skills. Uses skill names. Separate them with ';' for example Aiming: Mechanics
        SkipSkills = "Mechanics;Aiming",
        SkipFixers = "",
    },
    CAMmod = {
        -- This is the quantity of corpses that can be stacked on the same pile.(reboot required) Minimum=5 Maximum=1000 Default=25
        maximumCorpsePile = 25,
    },
    StandardisedExperience = {
        -- Disables the vanilla aiming xp dropoff after level 4.
        WantSTAiming = true,
        -- Optional XP multiplier for aiming. Default=Vanilla
        -- 1 = Vanilla
        -- 2 = 1.5x
        -- 3 = 2x
        -- 4 = 3x
        -- 5 = 5x
        AimingMultiplier = 1,
        -- Optional XP multiplier for reloading. Default=Vanilla
        -- 1 = 0.25x
        -- 2 = 0.5x
        -- 3 = 0.75x
        -- 4 = Vanilla
        -- 5 = 1.5x
        -- 6 = 2x
        -- 7 = 3x
        -- 8 = 5x
        ReloadMult = 2,
        -- When you reload, you only have a chance to gain XP. Default=Always
        -- 1 = Always
        -- 2 = Vanilla (50%)
        -- 3 = 33%
        -- 4 = 25%
        -- 5 = 20%
        -- 6 = 17%
        -- 7 = 14%
        -- 8 = 12.5%
        -- 9 = 11%
        ReloadChance = 1,
        -- In vanilla, XP gains are lowered and chance is decreased after level 4, making leveling much slower. Enable to restore this.
        ReloadNerf = false,
        -- As you walk in combat stance, you will reliably gain nimble XP over time.
        WantSTNimble = true,
        -- Increases the XP you gain in combat stance. This mod already causes you to gain XP much faster than in vanilla, so try it out before tweaking this setting! Default=Default
        -- 1 = Default
        -- 2 = 2x
        -- 3 = 5x
        -- 4 = 10x
        -- 5 = 20x
        NimbleMult = 1,
        -- How often you gain XP while in combat stance. Increase this to dampen the XP multiplier. Default=10 seconds (Default)
        -- 1 = 2.5 seconds
        -- 2 = 5 seconds
        -- 3 = 10 seconds (Default)
        -- 4 = 25 seconds
        NimbleDelay = 3,
        -- As you run, you will reliably gain sprinting XP over time.
        WantSTSprinting = true,
        -- Increases the XP you gain while sprinting. This mod already causes you to gain XP much faster than in vanilla, so try it out before tweaking this setting! Default=Default
        -- 1 = 0.2x
        -- 2 = Default
        -- 3 = 2x
        -- 4 = 5x
        -- 5 = 10x
        -- 6 = 20x
        SprintMult = 2,
        -- How often you gain XP while sprinting. Increase this to dampen the XP multiplier. Default=15 seconds (Default)
        -- 1 = 4 seconds
        -- 2 = 8 seconds
        -- 3 = 15 seconds (Default)
        -- 4 = 23 seconds
        -- 5 = 30 seconds
        -- 6 = 45 seconds
        -- 7 = 75 seconds
        SprintDelay = 3,
        -- Standardises all sources of passive XP, except from exercise.
        WantSTPassive = false,
        -- Increases the fitness XP you gain from all activities other than exercise. Default=Vanilla
        -- 1 = Vanilla
        -- 2 = 2x
        -- 3 = 3x
        -- 4 = 4x
        -- 5 = 5x
        -- 6 = 10x
        -- 7 = 15x
        -- 8 = 25x
        -- 9 = 50x
        FitnessBoost = 1,
        -- Increases the chance to gain fitness XP from all activities other than exercise. Default=Vanilla
        -- 1 = 3.5x
        -- 2 = 2.3x
        -- 3 = 1.4x
        -- 4 = Vanilla
        FitnessChance = 4,
        -- Increases the strength XP you gain from all activities other than exercise. Default=Vanilla
        -- 1 = 0.5x
        -- 2 = Vanilla
        -- 3 = 1.5x
        -- 4 = 2x
        -- 5 = 2.5x
        -- 6 = 5x
        -- 7 = 7.5x
        -- 8 = 12.5x
        -- 9 = 25x
        StrengthBoost = 2,
        -- Increases the chance to gain strength XP from all activities other than exercise. Default=Vanilla
        -- 1 = 3.5x
        -- 2 = 2.3x
        -- 3 = 1.4x
        -- 4 = Vanilla
        StrengthChance = 4,
    },
    Plumbing = {
        -- The percentage of the water pump filter that is consumed every 10 game minutes. Minimum=0.00 Maximum=100.00 Default=0.01
        PumpFilterUsage = 0.012,
        -- The percentage of the efficiency that a water pump loses every 10 game minutes. Minimum=0.00 Maximum=100.00 Default=0.00
        PumpEfficiencyLoss = 0.004,
        -- The amount of units of water that a 100% efficient pump delivers every 10 game minutes. Minimum=1 Maximum=100 Default=12
        PumpMaxWater = 12,
    },
    RefinedHotwiring = {
        -- Minimum=0 Maximum=10 Default=2
        UnhotwireElectrical = 2,
        -- Minimum=0 Maximum=10 Default=3
        UnhotwireMechanics = 3,
        -- Minimum=0 Maximum=10 Default=1
        KeyElectrical = 6,
        -- Minimum=0 Maximum=10 Default=2
        KeyMechanics = 8,
        -- Minimum=0 Maximum=10 Default=3
        KeyMetalworking = 10,
    },
    TrueMusicRadio = {
        -- Enabling this will increase the possibility of zombies being attracted to True Music Radio music. (Does not affect vanilla radio attraction.)
        TMRRadiosAttractZombies = false,
        -- Enabling this will allow the west station terminal to eject additional media. (Amounts based on filled amount settings)
        TMRTerminalEjectsMusic = true,
        -- How much music media spawns in the station terminals. Default=Random
        -- 1 = Very Low
        -- 2 = Low
        -- 3 = Medium
        -- 4 = High
        -- 5 = Random
        TMRMusicTerminalFilledAmount = 3,
        -- Enabling this will exclude the vanilla theme songs from playing on the radio stations unless the media is added to the terminals.
        TMRExcludeThemeSongs = true,
        -- Enabling this will exclude the songs added by the TCCacheMP prerequisite mod from playing on the radio stations unless the media is added to the terminals.
        TMRExcludeTCCacheMPSongs = true,
        -- Enabling this will exclude only the holiday songs added by the TCCacheMP prerequisite mod from playing on the radio stations unless the media is added to the terminals.
        TMRExcludeHolidaySongs = true,
        -- Enabling this will add weather broadcasting on the hour.
        TMRRadioWeatherBroadcast = true,
        -- Enabling this will add song announcements when new songs start.
        TMRRadioSongAnnouncements = true,
        -- Enabling this will add warning announcements when Horde Night starts. (Only if the Horde Night mod is enabled)
        TMRRadioHordeNightBroadcast = true,
        -- The frequency for the 1st True Music Radio station. (Default 94FM = 94000) Minimum=88000 Maximum=108000 Default=94000
        TMRChannel1 = 94000,
        -- The frequency for the 2nd True Music Radio station. (Default 94.2FM = 94200) Minimum=88000 Maximum=108000 Default=94200
        TMRChannel2 = 94200,
        -- The frequency for the 3rd True Music Radio station. (Default 94.4FM = 94400) Minimum=88000 Maximum=108000 Default=94400
        TMRChannel3 = 94400,
        -- The frequency for the 4th True Music Radio station. (Default 94.6FM = 94600) Minimum=88000 Maximum=108000 Default=94600
        TMRChannel4 = 94600,
        -- The frequency for the 5th True Music Radio station. (Default 94.8FM = 94800) Minimum=88000 Maximum=108000 Default=94800
        TMRChannel5 = 94800,
    },
    MFTEOTWC = {
        -- Decides whether or not cassettes will spawn. Requires you to reload the world to take effect.
        cassetteSpawn = true,
        -- Decides whether or not vinyls will spawn. Requires you to reload the world to take effect.
        vinylSpawn = true,
        -- The maximum number of cassettes that may spawn in a container is 1 + this number. Only applies to MFTEOTW tracks. Requires you to reload the world to take effect. Minimum=0 Maximum=10 Default=2
        maxCassettes = 2,
        -- The maximum number of vinyls that may spawn in a container is 1 + this number. Only applies to MFTEOTW tracks. Requires you to reload the world to take effect. Minimum=0 Maximum=10 Default=2
        maxVinyls = 1,
        -- Directly multiplies the chance that cassettes will spawn in a container. Requires you to reload the world to take effect. Minimum=0.00 Maximum=20.00 Default=1.00
        cassetteChance = 0.12,
        -- Directly multiplies the chance that vinyls will spawn in a container. Requires you to reload the world to take effect. Minimum=0.00 Maximum=20.00 Default=1.00
        vinylChance = 0.1,
        -- Hoards are boxes that can be opened to get 50 random cassettes or vinyls. They spawn very rarely in a select few containers. Requires you to reload the world to take effect.
        cacheSpawn = true,
        -- Hoards will give this many of their respective music item, without duplicates. Requires you to reload the world to take effect. Minimum=5 Maximum=100 Default=50
        cacheQuantity = 25,
        -- This value directly multiplies the spawn rate of Hoards. Requires you to reload the world to take effect. Minimum=0.00 Maximum=50.00 Default=1.00
        cacheSpawnChance = 0.5,
        -- Boxes can be opened to get 25 random cassettes or vinyls. They spawn very rarely in a select few containers. Requires you to reload the world to take effect.
        boxSpawn = true,
        -- Boxes will give this many of their respective music item, without duplicates. Requires you to reload the world to take effect. Minimum=5 Maximum=50 Default=25
        boxQuantity = 12,
        -- This value directly multiplies the spawn rate of Boxes. Requires you to reload the world to take effect. Minimum=0.00 Maximum=50.00 Default=1.00
        boxSpawnChance = 0.7,
        -- Stacks are items that can be opened to get 10 random cassettes or vinyls. They can spawn in place of any music item at the same chance as any other music item. Requires you to reload the world to take effect. Recommended that you turn this off if you aren't using the Main and Extended packs as Stacks may become too common.
        stackSpawn = true,
        -- Stacks will give this many of their respective music item, without duplicates. Requires you to reload the world to take effect. Minimum=5 Maximum=25 Default=10
        stackQuantity = 8,
        -- Decides whether or not cassettes will spawn on Zombies. Requires you to reload the world to take effect.
        zedMusic = false,
        -- Directly multiplies the chance that zombies will drop cassettes upon death. Requires you to reload the world to take effect. Minimum=0.00 Maximum=100.00 Default=1.00
        zedMusicChance = 1.0,
        -- This value sets the weight of all cassettes from any MFTEOTW pack as well as the base True Music cassettes. Requires you to reload the world to take effect. Minimum=0.00 Maximum=2.00 Default=0.05
        cassetteWeight = 0.05,
        -- This value sets the weight of all vinyls from any MFTEOTW pack as well as the base True Music vinyls. Requires you to reload the world to take effect. Minimum=0.00 Maximum=2.00 Default=0.10
        vinylWeight = 0.1,
        -- This value directly multiplies the rate at which Boomboxes consume battery power. Requires you to reload the world to take effect. Minimum=0.00 Maximum=100.00 Default=1.00
        batteryUse = 1.0,
        -- This value sets the weight of Boomboxes. Requires you to reload the world to take effect. Minimum=0.00 Maximum=10.00 Default=2.40
        boomboxWeight = 2.4,
    },
    zReAAS = {
        -- Enable to have the character mention armor element damage and absorption count before it starts to break.
        zReAAS_InfoChecker = false,
        -- How much damage the light armor can absorb before it starts to break.
        --  -Light armor includes, for example:
        --   Civilian Vest; Police Vest. Minimum=2 Maximum=30 Default=2
        zReAAS_LightArmorAbsorbCount = 2,
        -- How much damage the medium armor can absorb before it starts to break.
        --  -Medium armor includes, for example:
        --   Military Vest; "PALADIN" Vests. Minimum=4 Maximum=30 Default=4
        zReAAS_MediumArmorAbsorbCount = 4,
        -- How much damage the heavy armor can absorb before it starts to break.
        --  -Heavy armor includes, for example:
        --   "TRACTOR" Vest. Minimum=6 Maximum=30 Default=6
        zReAAS_HeavyArmorAbsorbCount = 6,
        -- How much damage the juggernaut armor can absorb before it starts to break.
        --  -Juggernaut armor includes, for example:
        --   Heavy "TRACTOR" Vest. Minimum=8 Maximum=30 Default=8
        zReAAS_JuggernautArmorAbsorbCount = 8,
        -- How much damage the light armor parts can absorb before they start to break.
        --  -Light armor parts include, for example:
        --    "PALADIN" Gloves; Some armored gloves and boots; Some armor elements. Minimum=2 Maximum=30 Default=2
        zReAAS_ArmorPartLightAbsorbCount = 2,
        -- How much damage the medium armor parts can absorb before they start to break.
        --  -Medium armor parts include, for example:
        --    "TRACTOR" Gloves; Some armored gloves and boots; Some armor elements. Minimum=3 Maximum=30 Default=3
        zReAAS_ArmorPartMediumAbsorbCount = 3,
        -- How much damage the heavy armor parts can absorb before they start to break.
        --  -Heavy armor parts include, for example:
        --    "TRACTOR" armor elements (Upper/Lower Leg/Arm armor).
        --  -Gloves and boots cannot be in this category!!! Minimum=4 Maximum=30 Default=4
        zReAAS_ArmorPartHeavyAbsorbCount = 4,
        -- How much damage the armored clothing can absorb before it starts to break.
        --  -Armored clothing includes, for example:
        --   "TRACTOR" Pants and Jacket. Minimum=2 Maximum=30 Default=2
        zReAAS_ArmoredClothesAbsorbCount = 2,
    },
    MoreImmersiveVehicles = {
        -- Chance of an open door on a car that appeared in the parking stall. Minimum=0 Maximum=100 Default=5
        ParkOpenedDoorChance = 5,
        -- Chance of an open trunk at a car that appeared in the parking stall. Minimum=0 Maximum=100 Default=10
        ParkOpenedTrunkDoorChance = 10,
        -- Chance of an open window at a car that appeared in the parking stall. Minimum=0 Maximum=100 Default=5
        ParkOpenedWindowChance = 5,
        -- Chance of an open door at a car that appeared on the road or in a traffic jam. Minimum=0 Maximum=100 Default=35
        RoadOpenedDoorChance = 35,
        -- Chance of an open trunk at a car that appeared on the road or in a traffic jam. Minimum=0 Maximum=100 Default=45
        RoadOpenedTrunkDoorChance = 45,
        -- Chance of an open window at a car that appeared on the road or in a traffic jam. Minimum=0 Maximum=100 Default=20
        RoadOpenedWindowChance = 20,
    },
    P4Decoholic = {
        -- Enables Adjust Item Position. (Decoholic)
        EnableAdjustPosition = true,
    },
    MedicineMoodles = {
        -- Minimum=0 Maximum=11 Default=6
        Antibiotics_Doctor = 6,
        -- Minimum=0 Maximum=11 Default=4
        Antidepressants_Doctor = 4,
        -- Minimum=0 Maximum=11 Default=2
        BetaBlockers_Doctor = 2,
        -- Minimum=0 Maximum=11 Default=1
        Painkillers_Doctor = 1,
        -- Minimum=0 Maximum=11 Default=3
        SleepingTablets_Doctor = 3,
        -- Minimum=0 Maximum=11 Default=5
        LemonGrass_Doctor = 5,
    },
    eggonsWorthwileCars2 = {
        -- Regulates how quickly will a trunk's capacity decrease depending on its damage. E.g.: <LINE>0 means no capacity loss regardless of trunk's damage. <LINE>1 means standard vanilla rate. <LINE>0.5 means 50% of vanilla rate (capacity is lost slower). <LINE>2 means 200% of vanilla rate (capacity is lost faster). Minimum=0.00 Maximum=10.00 Default=0.00
        CapacityChangeRate = 0.0,
        -- Trunk sizes will depend on the size of vehicle ranging from 25 to 300 for vanilla cars.
        ApplyCapacityBalance = true,
        -- Number by which all trunks' base capacities will be multiplied. E.g.: <LINE>1 means no change. <LINE>0.5 will reduce capacities by 50%. <LINE>2 will increase capacities by 100%. <LINE>"Base capacities" means either Eggon's balance (if you ticked the checkbox above) or vanilla (if not). Minimum=0.00 Maximum=10.00 Default=1.00
        CapacityMultiplier = 1.0,
        ApplyCapacityMultiplierToSeats = false,
        ApplyCapacityMultiplierToGloveBoxes = false,
        -- Engine loudness will be more aligned with size of the car (the bigger car, the louder engine) and it's type - sports cars are loud too! <LINE> <LINE>Engine quality and muffler will still impact the overall loudness. <LINE> <LINE>The loudness range remains the same as is for vanilla (just different cars will be loudest).
        ApplyLoudnessBalance = true,
        -- Engine power will be modified for some cars for additional flavor.
        ApplyPowerBalance = true,
    },
    OffroadGoBrrr = {
        -- Enable changes to offroad behavior
        Toggle = true,
        -- Heavy-Duty vehicles with less than specified HP will use Heavy-Duty Mass Multiplier, higher or Vans will use Standard Mass Multiplier. Set to 0 to disable Minimum=0 Maximum=1000 Default=600
        HeavyThreshold = 600,
        -- Lower value = better offroad performance Minimum=0.50 Maximum=3.00 Default=0.50
        HeavyMultiplier = 0.5,
        -- Standard vehicles with less than specified HP will use Standard Mas Multiplier, higher will use Sport Mass multiplier. Set to 0 to disable Minimum=0 Maximum=1000 Default=500
        StandardThreshold = 500,
        -- Lower value = better offroad performance Minimum=0.75 Maximum=3.00 Default=0.75
        StandardMultiplier = 0.75,
        -- Sport vehicles with less than specified HP will not be affected by any multiplier. Set to 0 to disable Minimum=0 Maximum=1000 Default=500
        SportThreshold = 500,
        -- Lower value = better offroad performance. Unlike other multipliers it also scales with vehicle Horse Power to make sure all affected Sport vehicles are equally bad offroad Minimum=1.25 Maximum=3.00 Default=1.25
        SportMultiplier = 1.25,
        -- Enable offroad towing nerf for Sport vehicles
        SportOffroadTowing = true,
        -- Specify vehicles which aren't Heavy-Duty but should be great offroad. Use space as the delimiter, default: Base.63beetleBuggy Base.63Type2VanApocalypse Base.OffRoad
        Offroad = "Base.63beetleBuggy Base.63Type2VanApocalypse Base.OffRoad",
        -- Specify vehicles which shouldn't be affected by the mod. Use space as the delimiter
        None = "",
        -- Vehicles with script mass less than specified value will not be affected at all. Example: to exclude motorcycles set this to 350 Minimum=0 Maximum=1000 Default=0
        ExcludeByWeight = 0,
        -- Print debug info in console
        Debug = false,
    },
    Kamer_ShowWallHealth = {
        -- <H2><ORANGE>Choose visiblity mode <CENTRE><TEXT><BR>Everyone - everyone can see menu, <LINE>Admin Only - admins/debug can see menu, <LINE>Disable - no one can see menu, <LINE> Default=Everyone
        -- 1 = Everyone
        -- 2 = Admin Only
        visibility = 1,
        -- <H2><ORANGE>Choose menu position <CENTRE><TEXT><BR>First - first on the list, <LINE>Middle - in between list, <LINE>Last - last on the list, <LINE>Above Repair Wall - first if 'Repair wall' mod is not enable, <LINE> Default=Above Repair Wall
        -- 1 = First
        -- 2 = Last
        position = 3,
        -- <H2><ORANGE>Choose to show '?' icon
        showIcons = true,
    },
    FixInside = {
        -- Reduces moderately game performances. Only usefull when you want to fix a building created before activating Fix Inside Player Building mod.
        ActivePatch = false,
    },
    KYRRealWeatherMod = {
        -- Higher Number for More Variation in Summer Day Hours and Winter Night Hours! (38 is Base Game) Minimum=20 Maximum=65 Default=40
        LatitudeVariation = 35,
        -- Change to adjust the max temp of the World! (25 is Base Game / Still subject to Season Variation) Minimum=0 Maximum=50 Default=35
        Maxtemp = 30,
        -- Change to adjust the min temp of the World! (0 is Base Game / Still subject to Season Variation) Minimum=-170 Maximum=0 Default=-15
        Mintemp = -4,
        -- Overall variation in Temp Ranges Between Seasons (7 is Base Game) Minimum=7 Maximum=40 Default=9
        SeasonVariation = 8,
    },
    WhereAmI = {
        -- If enabled, the region indicator will not appear at all when a Player is outside any known regions. 
        HideUIOffRegion = false,
    },
    ammomakerOptions = {
        -- Nitre per pot of bird excrement Minimum=1 Maximum=100 Default=10
        NitreYield = 10,
        -- Bird excrement per seed (bird feeder) Minimum=1 Maximum=5 Default=1
        BirdExYield = 1,
        -- Minimum spawn amount per pile (foraging) Minimum=1 Maximum=200 Default=8
        BirdExSpawnMin = 8,
        -- Maximum spawn amount per pile (foraging) Minimum=1 Maximum=200 Default=24
        BirdExSpawnMax = 24,
        -- Minimum spawn amount per pile (foraging) Minimum=1 Maximum=10 Default=1
        BirdFeatherSpawnMin = 1,
        -- Maximum spawn amount per pile (foraging) Minimum=1 Maximum=10 Default=3
        BirdFeatherSpawnMax = 4,
        -- Deactivates ammo maker charcoal recipes
        DeactivateCharcoalRecipes = true,
        -- Activates ammo maker archery components
        ActivateArchery = true,
    },
    AutoMechanics = {
        -- Accepted risk percentage of losing part condition. <LINE> 0 (default - recommended for public servers) will protect your vehicles parts conditions. <LINE> 100 let players do whatever they want (recommended for private servers). <LINE> Only active on multiplayer clients or solo users with Verbose on. Minimum=0 Maximum=100 Default=0
        ConditionLossPercentageThreshold = 0,
    },
    AutoMoveTo = {
        -- Usefull for a server to force client options.
        Override = false,
        -- Requires override Mod Options active Default=Mouse Left Double Click
        -- 1 = KEY BINDINGS > Player Control > Move To
        -- 2 = Mouse Left Click
        Mode = 3,
        -- Requires override Mod Options active
        Cursor = false,
    },
    AutoGate = {
        -- Everytime the gate is closed by a controller, it will also be locked.
        AutoLockGate = true,
        -- Max range that a controller can interact with the gate. Minimum=8 Maximum=50 Default=35
        ControllerRange = 35,
        -- Total uses each battery can have. Minimum=10 Maximum=300 Default=100
        BatteryMaxUseCount = 100,
        -- Level of Metalworking required to install gate motor. Minimum=1 Maximum=10 Default=4
        LevelRequirementsInstallMetalWelding = 4,
        -- Level of Electrical required to interact with the controller. Minimum=1 Maximum=10 Default=1
        LevelRequirementsControllerInteraction = 1,
        -- Level of Mechanics required to interact with the gate. Minimum=1 Maximum=10 Default=1
        LevelRequirementsGateInteraction = 1,
        -- Level of Electrical required to make controllers. (needs restart) Minimum=1 Maximum=10 Default=2
        LevelRequirementsMakeControllerElectrical = 2,
        -- Level of Electrical required to make a gate motors. (needs restart) Minimum=1 Maximum=10 Default=3
        LevelRequirementsMakeComponentsElectrical = 3,
        -- Level of Mechanics required to make a gate motors. (needs restart) Minimum=1 Maximum=10 Default=4
        LevelRequirementsMakeComponentsMechanics = 4,
    },
    KatanaSheath = {
        -- Choose a starter pack for your character Default=Nothing
        -- 1 = Nothing
        -- 2 = Sheath
        starterPack = 1,
    },
    BetterBatteries = {
        -- Amount of in-game minutes it takes to charge a battery from empty to full without penalties / buffs in place. Minimum=0.00 Maximum=1440.00 Default=60.00
        CrankTime = 60.0,
        -- Determines whether or not higher strength levels will apply a time buff.
        StrengthBuff = true,
        -- Determines whether or not low endurance will apply a time penalty. (Regardless of this setting, you won't be permitted to use the Hand Crank at extremely low endurance.)
        EndurancePenalty = true,
        -- Determines whether or not unhappiness will apply a time penalty.
        UnhappinessPenalty = true,
        -- Sets the maximum charge a handcrank can restore a battery to. Minimum=0.00 Maximum=1.00 Default=1.00
        MaximumCharge = 1.0,
        -- Lifetime multiplier applied to all electrical devices that use batteries. (Negative value results in unlimited charge, 0 results in instant charge loss.) Minimum=-1.00 Maximum=9999.00 Default=1.00
        LifetimeMult = 1.2,
    },
    HIC = {
        -- Enable or disable the mod.
        Active = true,
        -- Enable or disable moodle.
        MoodleActive = true,
        -- Minimum condition percentage required for vehicle parts to enable hiding. Minimum=0 Maximum=100 Default=15
        MinimalCondition = 15,
        -- Radius in which zombies can detect player in the car. Minimum=1 Maximum=10 Default=2
        Radius = 2,
        -- Radius within which zombies can detect a player sleeping in a car. Minimum=1 Maximum=10 Default=1
        SleepRadius = 1,
        -- If enabled, checks for the Conspicuous and Inconspicuous traits.
        CheckForTraits = true,
        -- Adjusts radius based on a trait coefficient representing a 0-100 percent value. Minimum=0 Maximum=100 Default=60
        TraitCoefficient = 60,
        -- If enabled, the player cannot hide while being chased by a zombie, even if not visible. If disabled, the player can hide when not seen by a zombie.
        ZombieMemory = false,
    },
    StairsAlert = {
        -- Determines if Players will say something if they see zombies upstairs, or not. 
        DisplayIfNoZombies = true,
        -- Determines if Players will include the number of zombies they see in their speeches. 
        DisplayZombieAmount = true,
        -- Displays a 2D marker symbol in the ground where the zombie is supposed to be upstairs. 
        DisplayMarker = false,
    },
    MultiHitLimiter = {
        -- Require weapons to be two-handed to have multi hit.
        TwoHandReq = true,
        -- Require weapons to have a maximum range greater than or equal to a specified value to have multi hit.
        RangeBool = true,
        -- If enabled, weapons with a maximum range less than this value will have multi hit disabled. Minimum=0.00 Maximum=100.00 Default=1.21
        RangeNum = 0.0,
        -- If strength is below this value, multi hit is disabled for equipped weapons. Minimum=0 Maximum=10 Default=0
        StrReq = 0,
        -- If fitness is below this value, multi hit is disabled for equipped weapons. Minimum=0 Maximum=10 Default=0
        FitReq = 0,
        -- If an equipped weapon's skill level is below this value, multi hit is disabled for it. Minimum=0 Maximum=10 Default=0
        SkillReq = 0,
        -- If any number other than 0, multi hit weapons with a max hit count above this value will be reduced to it. Minimum=0 Maximum=5 Default=0
        MaxHitCap = 0,
        -- Allow multi hit for Axe weapons.
        Axe = true,
        -- Allow multi hit for Long Blunt weapons.
        LongBlunt = true,
        -- Allow multi hit for Short Blunt weapons.
        SmallBlunt = true,
        -- Allow multi hit for Long Blade weapons.
        LongBlade = true,
        -- Allow multi hit for Short Blade weapons.
        SmallBlade = true,
        -- Allow multi hit for Spear weapons.
        Spear = false,
        -- Allow multi hit for Unarmed weapons.
        Unarmed = true,
        -- A semicolon-separated list of item types that won't have multi hit disabled, overriding the above settings.
        Whitelist = "Base.BareHands",
        -- A semicolon-separated list of item types that will have multi hit disabled, overriding the above settings.
        Blacklist = "Base.Nightstick",
    },
    VGC = {
        -- Loot Rarity
        --  - Insanely Rare: Recommended setting
        --  - Extremely Rare: 2x the loot Default=Insanely Rare
        -- 1 = Insanely Rare
        EnumLootRarity_opt = 1,
    },
    RespawnInCarMod = {
        -- If TRUE, during a new game, after the creation of a new character, if a position affiliated with the name of the character is known, even if the character is new, he will be forced to join his position , of course, this option is not valid after a death, this option is present for the Avatar mod, this offers administrators the possibility of placing avatars with the name of a player who has never joined the server part / Game, and thus force the new player to join the recorded position via the Avatar.
        ForceToRespawnInCarEvenIfNewPlayer = false,
        -- If TRUE, then complete and optimal protection will be applied to players during their respawns, only when the RIC mod forces the respawn, to be prioritized on coop servers (invisible and no clip player), if FALSE, then just dont attack by zombies.
        FullProtectDuringRespawn = false,
    },
    SleepWithFriends = {
        -- Choose if Sleep Length is being set to real-time minutes or in-game hours. Default=Real-Time Minutes
        -- 1 = Real-Time Minutes
        RTorIG = 1,
        -- Average time spent sleeping when fully fatigued.
        SleepLength = "2.0",
        -- Determines how fast endurance is recovered while sleeping. 1 is the same rate as fatigue, 1.5 is one and a half times as fast, 2 is twice as fast, etc.
        EndurMulti = "2.0",
        -- Set if the AutoWake feature is enabled. Default=True
        -- 1 = True
        AutoWake = 1,
    },
}
