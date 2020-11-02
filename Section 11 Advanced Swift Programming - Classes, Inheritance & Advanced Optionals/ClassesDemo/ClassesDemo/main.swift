
let skeleton1 = Enemy()
print(skeleton1.health)
skeleton1.move()
skeleton1.attack()
let skeleton2 = skeleton1
skeleton1.takeDamage(amount: 10)
skeleton2.takeDamage(amount: 20)
print(skeleton1.health)
print(skeleton2.health)



let dragon = Dragon()
print(dragon.health)
dragon.attackStrength = 15
dragon.move()
dragon.attack()
dragon.talk(speech: "My teeth are swords! My claws are spears! My wings are are a hurricane!")

