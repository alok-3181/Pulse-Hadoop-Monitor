import mechanize
browser = mechanize.Browser()
browser.open('http://server000002285:7180/cmf/login')
browser.select_form(nr = 0)
browser.form['j_username'] = 'symmmuuu'
browser.form['j_password'] = '45678123'
browser.submit()
response = browser.open('http://server000002285:7180/cmf/allHealthIssues')
print response.read()