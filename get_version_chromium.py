import pandas as pd

csv = pd.read_csv('https://omahaproxy.appspot.com/all').filter(items = ['channel', 'current_version']).dropna()
versions = csv[csv['channel'] == 'stable'].current_version.unique()

if len(versions) == 0:
	sys.exit('Version not found')

print(sorted(versions, key=lambda v: int(v.rsplit('.', 1)[1]), reverse=True)[0])