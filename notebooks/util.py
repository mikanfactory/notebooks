import pickle
from hashlib import md5


import pystan


def stan_cache(model_code, model_name=None, **kwargs):
    code_hash = md5(model_code.encode('ascii')).hexdigest()
    cache_fn = './cache/cached-{}-{}.pkl'.format(model_name, code_hash)
    try:
        sm = pickle.load(open(cache_fn, 'rb'))
        return sm
    except:
        sm = pystan.StanModel(model_code=model_code)
        with open(cache_fn, 'wb') as f:
            pickle.dump(sm, f)
        return sm
    else:
        print("Using cached StanModel")

