from ape import accounts, project, chain, Contract


def deploy():
    account = accounts.load("test1")

    print("Deploying contract....")
    account.deploy(project.MeMyselfAndAi)

    print("Contract Deployed!")


def can_decrypt():
    me_meyself_and_ai = project.MeMyselfAndAi.at(
        "0xc4787aA24E51a22f92910F97320aA98e167c7695"
    )
    print(me_meyself_and_ai)
    res = me_meyself_and_ai.can_decrypt(1, "0x5F7FbE4bf8987FA77Ec6C22FD3f3d558B3b68D4e")
    print(res)


def push_daily_reminder():
    # acct = accounts.load("test1")
    me_meyself_and_ai = project.MeMyselfAndAi.at(
        "0xc4787aA24E51a22f92910F97320aA98e167c7695"
    )

    all_users = me_meyself_and_ai.all_users()
    first_user = all_users[0]
    print(first_user)


def main():
    push_daily_reminder()
