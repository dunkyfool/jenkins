import jenkins

server = jenkins.Jenkins('http://localhost:8080', username='admin', password='admin')
user = server.get_whoami()
print('Hello %s from Jenkins' % (user['fullName']))

server.create_job('empty', jenkins.EMPTY_CONFIG_XML)
jobs = server.get_jobs()
print jobs

my_job = server.get_job_config('empty')
print(my_job)

server.delete_job('empty')
