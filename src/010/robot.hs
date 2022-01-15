robot (name, attack, hp) = \message -> message (name, attack, hp)

name (n, _, _) = n

attack (_, a, _) = a

hp (_, _, hp) = hp

getName aRobot = aRobot name

getAttack aRobot = aRobot attack

getHP aRobot = aRobot hp

setName aRobot value = aRobot (\(_, a, h) -> robot (value, a, h))

setAttack aRobot value = aRobot (\(n, _, h) -> robot (n, value, h))

setHP aRobot value = aRobot (\(n, a, _) -> robot (n, a, value))

printRobot aRobot = aRobot (\(n, a, h) -> n ++ " attach:" ++ (show a) ++ " health:" ++ (show h))

damage aRobot attackDamage = aRobot (\(n, a, h) -> robot (n, a, h - attackDamage))

fight aRobot defender = damage defender attack
  where
    attack = if getHP aRobot > 10 then getAttack aRobot else 0

killerRobot = robot ("Killer", 25, 200)

nicerRobot = setName killerRobot "Kitten"

gentlerRobot = setAttack killerRobot 5

softerRobot = setHP killerRobot 50