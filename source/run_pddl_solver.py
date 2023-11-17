import requests, backoff

@backoff.on_exception(backoff.expo, (ConnectionResetError, requests.exceptions.ConnectionError, requests.exceptions.ReadTimeout))
def post_pddl(data):
    resp = requests.post('http://solver.planning.domains/solve',
                        verify=False, json=data, timeout=5).json()
    return resp

def run_solver(df, pf):
    data = {'domain': df,
            'problem': pf}
    resp = post_pddl(data)
    return resp

#if main
if __name__ == "__main__":
    df = open("trial_df.pddl", "r").read()
    pf = open("trial_pf.pddl", "r").read()

    resp = run_solver(df, pf)

    print(resp)
    print([x ["name"] for x in resp['result']['plan']])