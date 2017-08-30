import requests

f = open('/path/to/url-list.txt', 'r')
output = open('/path/to/url-list-output.txt', 'w+')
"""
Read a file line by line, where each line is an URL, then check the status code
of the URL

If the URL is valid then append it to the output file, otherwise append satus
code instead
"""
for line in f:
    l = line.replace('\n', '')
    s = requests.get(l).status_code
    if s == 200:
        print(line)
        output.write(line)
    else:
        print('{}\n'.format(s))
        output.write('{}\n'.format(s))

output.close()
