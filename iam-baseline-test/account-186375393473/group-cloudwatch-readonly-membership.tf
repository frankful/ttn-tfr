# aws_iam_group_membership does not support import; the members below
# are the current inventory snapshot, so the first apply adopts the
# existing membership without removing anyone.
resource "aws_iam_group_membership" "group_cloudwatch-readonly_membership" {
	name  = "cloudwatch-readonly-membership"
	group = "cloudwatch-readonly"
	users = [
		"baoqiang.liu",
		"bingjie.chen",
		"chenshang",
		"conglin.wu",
		"guance.chen",
		"guomiao",
		"heyang",
		"jinchun.ma",
		"jinmin.zhou",
		"liuxin",
		"maozhong.zheng",
		"qianqian.chen",
		"shawn.dang",
		"tianbing",
		"tudi.liang",
		"wangjie",
		"yadong.liu",
		"yangyang.fang",
		"yawei.liu",
		"yihang.chen",
		"zhenya.li",
	]
}
