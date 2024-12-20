extends BaseReward

func beforeAtk(monster:BaseMonster,hit_num):#怪物收到伤害前触发
		var t = randi()%100
		print("beforeAtk","hit_num:",hit_num,"count:",count,"t:",t)
		if t < (10 * count):
			return hit_num
		return 0
