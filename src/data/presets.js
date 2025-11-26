export const PRESETS = {
    'apocalypse': {
        label: 'Apocalypse (Hardcore)',
        description: 'Stealth focus. Short lifespan. Combat best avoided.',
        data: {
            ZombieLore: {
                Speed: 2, // Fast Shamblers
                Strength: 2, // Normal
                Toughness: 2, // Normal
                Transmission: 1, // Blood + Saliva
                Cognition: 3, // Basic Navigation
                Memory: 2, // Normal
                Decomp: 1, // Slow + Weakens
                Sight: 2, // Normal
                Hearing: 2, // Normal
                Smell: 2, // Normal
            },
            ZombieConfig: {
                PopulationMultiplier: 1.0,
                PopulationStartMultiplier: 1.0,
                PopulationPeakMultiplier: 1.5,
            },
            Loot: {
                Rarity: 3, // Rare
                FoodLoot: 3, // Rare
                WeaponLoot: 3, // Rare
                OtherLoot: 3, // Rare
            },
            World: {
                WaterShutModifier: 14,
                ElecShutModifier: 14,
                AlarmFrequency: 4, // Often
                LockedHouses: 4, // Often
            }
        }
    },
    'survivor': {
        label: 'Survivor (Balanced)',
        description: 'Powerful combat. Longer lifespan. A challenging game.',
        data: {
            ZombieLore: {
                Speed: 2, // Fast Shamblers
                Strength: 2, // Normal
                Toughness: 2, // Normal
                Transmission: 1, // Blood + Saliva
            },
            ZombieConfig: {
                PopulationMultiplier: 1.0,
                PopulationStartMultiplier: 1.0,
                PopulationPeakMultiplier: 1.5,
            },
            Loot: {
                Rarity: 2, // Normal
                FoodLoot: 2, // Normal
                WeaponLoot: 2, // Normal
                OtherLoot: 2, // Normal
            },
            World: {
                WaterShutModifier: 14,
                ElecShutModifier: 14,
                AlarmFrequency: 3, // Sometimes
                LockedHouses: 3, // Sometimes
            }
        }
    },
    'builder': {
        label: 'Builder (Creative/Easy)',
        description: 'Construction focus. Easy farming. Very few enemies.',
        data: {
            ZombieLore: {
                Speed: 3, // Shamblers
                Strength: 3, // Weak
                Toughness: 3, // Fragile
                Transmission: 1, // Blood + Saliva
            },
            ZombieConfig: {
                PopulationMultiplier: 0.2, // Very Low
                PopulationStartMultiplier: 0.2,
                PopulationPeakMultiplier: 0.5,
            },
            Loot: {
                Rarity: 1, // Abundant
                FoodLoot: 1, // Abundant
                WeaponLoot: 1, // Abundant
                OtherLoot: 1, // Abundant
            },
            World: {
                WaterShutModifier: -1, // Instant (or never, depends on logic, usually -1 is instant in some contexts but 2-6 months in others. Using high value for builder)
                // Actually for builder usually you want resources.
                // Let's stick to standard builder defaults:
                WaterShutModifier: 30,
                ElecShutModifier: 30,
                AlarmFrequency: 1, // Never
                LockedHouses: 1, // Never
                XPMultiplier: 2.0, // Fast XP
            }
        }
    },
    'high_loot_pvp': {
        label: 'High Loot PvP',
        description: 'Abundant resources for fast gearing and PvP focus.',
        data: {
            Loot: {
                Rarity: 1, // Abundant
                FoodLoot: 1, // Abundant
                WeaponLoot: 1, // Abundant
                OtherLoot: 1, // Abundant
                MedicalLoot: 1, // Abundant
                LiteratureLoot: 1, // Abundant
                SurvivalGearsLoot: 1, // Abundant
                MechanicsLoot: 1, // Abundant
            },
            World: {
                XPMultiplier: 3.0, // Very Fast XP
                Map: {
                    AllowMiniMap: true,
                    AllowWorldMap: true,
                    MapAllKnown: true,
                }
            }
        }
    },
    'insane': {
        label: 'Insane Population',
        description: 'Extreme zombie population. Good luck.',
        data: {
            ZombieConfig: {
                PopulationMultiplier: 4.0, // Insane
                PopulationStartMultiplier: 4.0,
                PopulationPeakMultiplier: 4.0,
            }
        }
    }
};
