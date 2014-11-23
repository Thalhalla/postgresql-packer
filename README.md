#postgresql-packer

Packer Postgres builder
-- in dev still

uses this cookbook
https://github.com/hw-cookbooks/postgresql-packer

of note you’ll want to generate a new pass for the role like it says in the Chef-solo section

copied here:


Chef Solo Note
==============

The following node attribute is stored on the Chef Server when using
`chef-client`. Because `chef-solo` does not connect to a server or
save the node object at all, to have the password persist across
`chef-solo` runs, you must specify them in the `json_attribs` file
used. For Example:

    {
      "postgresql": {
        "password": {
          "postgres": "iloverandompasswordsbutthiswilldo"
        }
      },
      "run_list": ["recipe[postgresql::server]"]
    }

That should actually be the "encrypted password" instead of cleartext,
so you should generate it as an md5 hash using the PostgreSQL algorithm.

* You could copy the md5-hashed password from an existing postgres
database if you have `postgres` access and want to use the same password:<br>
`select * from pg_shadow where usename='postgres';`
* You can run this from any postgres database session to use a new password:<br>
`select 'md5'||md5('iloverandompasswordsbutthiswilldo'||'postgres');`
* You can run this from a linux commandline:<br>
`echo -n 'iloverandompasswordsbutthiswilldo''postgres' | openssl md5 | sed -e 's/.* /md5/'`
