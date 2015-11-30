[33mcommit c424bee866fbf5c5cf1c26c8e5228de53241ae82[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Mon Nov 30 21:30:08 2015 +0000

    added xls rendering (via template). csv now rendered via template.

[33mcommit 71a2206ef9e0cdb6b008056db337644bdfaa9b31[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Mon Nov 30 17:11:49 2015 +0000

    added unpaginated csv and json responses

[33mcommit fccf8f835cde8f4bc883fdabe7c3118d5eaac5bf[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Mon Nov 30 17:10:57 2015 +0000

    added to_csv class method

[33mcommit 30d76d99ea4a1a85db05e8da697a4ca47edc23b3[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Mon Nov 30 17:09:46 2015 +0000

    requiring csv

[33mcommit e12efc81fe0256c876779ec6128d8e841c4f356a[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Mon Nov 30 17:08:31 2015 +0000

    set pagination page default to 10

[33mcommit eacf9dd07e733fab99c9347a313e6eeed6f26ca0[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Mon Nov 30 13:03:32 2015 +0000

    set instrument policies according with user role

[33mcommit e4e1ab99440bce2433ae61712ae5f2364e6369e2[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Mon Nov 30 13:00:57 2015 +0000

    added user role predicate methods

[33mcommit febb1ddcfc6c47b4edba39c8f35f110b4edd2742[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Mon Nov 30 11:33:10 2015 +0000

    updated seeds to include users role

[33mcommit f371213bd217536c32fb441f648e81ff5f865986[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Mon Nov 30 11:32:27 2015 +0000

    added role to User

[33mcommit ab6fdb239147aa4c154f15847d65eff882ba8a97[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Sun Nov 29 19:00:46 2015 +0000

    show/hide actions according to authorization

[33mcommit a4416c395d97a6f9b21c0620648d72ee474b3495[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Sun Nov 29 18:59:00 2015 +0000

    enforced authorization on all actions

[33mcommit 9121cb46948511f534672239e28feddcb43089cb[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Sun Nov 29 18:58:24 2015 +0000

    enforce authorization (except for user authentication)

[33mcommit 355ad56fb3b922f1fad25dd0bfd3efe7d8a8bac9[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Sun Nov 29 18:57:28 2015 +0000

    added instruments authorization policy

[33mcommit 64311e7d501a7a7337718af8bd24a4383f0359be[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Sun Nov 29 18:56:38 2015 +0000

    added default authorization policy

[33mcommit 1c29e329ece9ace2ef25b06dc03c09589ef41bab[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Sun Nov 29 18:53:51 2015 +0000

    added pundit

[33mcommit c625d803929de2565985b24c5443ef7b6c5dec04[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Sun Nov 29 15:48:49 2015 +0000

    scoped instrument creation to user

[33mcommit 09a79906c43494cd0501b7c0db867f9d0506b0b0[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Sun Nov 29 15:41:23 2015 +0000

    user has_many instruments

[33mcommit 0791b5f0f69c49c83edb0848213d4ea6e0b81da8[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Sun Nov 29 15:41:02 2015 +0000

    instrument (must) belong to a user

[33mcommit 0b55ecd3ef49106f3324b8a6240ab8c00e04af1e[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Sun Nov 29 15:39:10 2015 +0000

    seeding users and instruments belonging to users

[33mcommit e38f7f16774f75d418e02e571ab11ed459f9de09[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Sun Nov 29 15:38:26 2015 +0000

    added reference, index, foreign key to user

[33mcommit d0c2fcb88e27919284efbbf439e6eccd23d6ae6b[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Sun Nov 29 15:37:05 2015 +0000

    creating users table first

[33mcommit f754cecc6a761967846cbe46632c17ac29403ad9[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Sun Nov 29 13:51:06 2015 +0000

    restyled login button

[33mcommit 72690ab4b7f81a93cbb71a71f892e165f0077cfb[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Sun Nov 29 13:48:20 2015 +0000

    customized devise views

[33mcommit 9c667918fa3f760fd2ecb6dbc9d4471ca647e9e2[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Sun Nov 29 13:47:46 2015 +0000

    brand links to root. added sign up, login, logout, user edit links

[33mcommit 81f7027da6d099560c7c3b628f08f800bb55619f[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Sun Nov 29 13:46:14 2015 +0000

    authenticate user before every action

[33mcommit a78347b8f43c33e408f8885548b648cc0f1ee355[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Sun Nov 29 13:45:24 2015 +0000

    added User migration, model, spec

[33mcommit 7f5ea84b40340c748a5a9cb6da2209de396952ec[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Sun Nov 29 13:44:12 2015 +0000

    added devise i18n and initializer

[33mcommit 874281c6673fbcbf2d1cb043ad23ce3bb914c6c3[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Sun Nov 29 13:14:40 2015 +0000

    configure default url host for action_mailer

[33mcommit 0d4ff6e9ac11cfd0dc816de9098f91b9744cde21[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Sun Nov 29 13:13:04 2015 +0000

    added devise and root routes

[33mcommit 5183cc2468f788b6f1de6f0cd214288015fb3a28[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Sun Nov 29 13:11:50 2015 +0000

    restyled back button

[33mcommit 1697f8d0b7ba8392d6768c352904b75f6da4f570[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Sun Nov 29 13:10:51 2015 +0000

    added devise

[33mcommit acec70473b4147be0aa03e37bc4626d5d92704b3[m
Author: Luis Bacelar <lmbacelar@gmail.com>
Date:   Sun Nov 29 00:01:15 2015 +0000

    added pagination, default per_page, default renderer, custom view helper

[33mcommit 0ce4bbde3cf32af9767ed9206a330b366350260d[m
Author: Luis Bacelar <lmbacelar@localhost.localdomain>
Date:   Sat Nov 28 19:00:23 2015 +0000

    first commit
