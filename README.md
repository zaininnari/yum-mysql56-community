yum-mysql-community Cookbook
============

Requirements
------------
* Chef 11 or higher
* yum cookbook version 3.0.0 or higher
* CentOS 6

Use
-----
edit `Berksfile`
``` ryuby
site :opscode
cookbook 'yum-mysql56-community' , git: 'git://github.com/zaininnari/yum-mysql56-community.git'
cookbook 'mysql'
```

```
berks install --path cookbooks
```

edit `node.json`

```javascript
{
    "run_list": [
        "recipe[yum-mysql56-community]",
        "recipe[mysql::client]",
        "recipe[mysql::server]"
    ],
    "mysql": {
        "client": {
            "packages": ["mysql-community-client", "mysql-community-devel"]
        },
        "server": {
            "packages": ["mysql-community-server"]
        }
    }
}
```

run chef
```sh
knife solo cook user@example.com
```


License & Authors
-----------------

```text
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
