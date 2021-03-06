Git Pre-Commit Check
===


## What Is This About?

1. Check If Commit Contains Chinese Characters, No Chinese Characters Is Allowed!

2. Check If Commit Message Contains "ref #number" Reference On The First Of The Comment, 
This Number Is What Exactly Your Code Done. 
It Match The Bug Number, Todo List Number, Or Any Function Number To Solve On The Teambition Or Solftware Alike.

3. You Can Do More... As You Like...


## How Can I Do This?

This Is The Check Code:

```ruby
#!/usr/bin/env ruby

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

message_file = ARGV[0]
message = File.read(message_file)

$chineseReg = /[\u4e00-\u9fa5]/

if $chineseReg.match(message)
  puts "Error: -----------------------------------------" 
  puts " Your commit message contains chinese character." 
  puts " It must contain no chinese."
  puts "------------------------------------------------" 
  exit 1
end

$refReg = /^refs\s#[0-9]+,.*\S+.*/

if !$refReg.match(message)
  puts "Error: -----------------------------------------" 
  puts " Your commit message is not formatted correctly." 
  puts " It must contain an issue number." 
  puts " Example:" 
  puts "      refs #99999, Added some new feature" 
  puts "------------------------------------------------" 
  exit 2
end

```

### Using Directly With Git Hook

First, Create Your Git Project.

Enter The `.git/hooks` Folder, If You Get The Project With `git init` Command, This Folder Exists.

If The Folder Doesn't Exist, Create By Yourself.

Create A File Called `commit-msg`, And Paste The Following Ruby Code.

Success!!


### Using With `husky` Module

**Dependency**: `npm` / `yarn`, `husky`.

Enter The Source Home Folder, 
Create Folder `scripts/` And Put File `commit-msg.rb` With Contents Above Typed In It.

Init `package.json` With `npm init` OR `yarn init` If It Doesn't Exist.

Put The Following Content Into The Proper Position, Keep The JSON Style.

```js
  "scripts": {
    "commitmsg": "ruby scripts/commit-msg.rb ${GIT_PARAMS}"
  },
```

After These Steps, When Doing `git commit` It Will Automatically Check The Comments.

Success!!


## Say Something More...

Related Document, See: https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks

Husky.js Document, See: https://github.com/typicode/husky





