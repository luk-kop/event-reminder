#!/bin/bash
set -e

if [ "$DUMMY_DATA" = true ]; then
psql -v ON_ERROR_STOP=1 --username reminderuser --dbname reminderdb <<-EOSQL
  INSERT INTO "user" ("username", "password_hash", "email", "access_granted", "role_id", "last_seen", "creation_date", "failed_login_attempts", "pass_change_req")
  VALUES ('john_doe', 'pbkdf2:sha256:150000\$5b2CvGLQ\$0cec90763090f8029aa7b02f15d0667a1519197beb2b5481cf42304272a29318','john_doe@niepodam.pl', True, '2', NULL, NOW()::timestamp, 0, False),
  ('marry', 'pbkdf2:sha256:150000\$b3mHMA6y\$4a5ae9b30d72b56e0d20bbd17bb0376daea34d2236524b314fca05d77f179245','marry@niepodam.pl', True, '2', NULL, NOW()::timestamp,0, False),
  ('test_user', 'pbkdf2:sha256:150000\$EnX6y1Zd\$4baa1012676b859f909441308c05d3ad2445f6ba546daebfedd17729e9380b41','test_user@niepodam.pl', True, '2',NULL, NOW()::timestamp, 0, False),
  ('harry', 'pbkdf2:sha256:150000\$433EVzsc\$1c8b90c25b4d9a8a80004e1ee32845144410a146fa36c151fe0fde5038b5f11e','harry@niepodam.pl', False, '2', NULL, NOW()::timestamp, 0, False),
  ('ponton', 'pbkdf2:sha256:150000\$KVIJyeDn\$80506687915bf7bd2e9d29ab7c0863cb229d856a47f4be32f905251258288d57','ponton@niepodam.pl', True, '2', NULL, NOW()::timestamp, 0, False),
  ('shrek', 'pbkdf2:sha256:150000\$3hFw6hxg\$4f9954488ce092a158bacad6295d776d18f2dcf8aecf13d5520063bb45c45c44','shrek@niepodam.pl', True, '2', NULL, NOW()::timestamp, 0, False),
  ('john.box', 'pbkdf2:sha256:150000\$mJSVm88y\$ee37972bcccbad6fc4402a98ade35d0c3cd37f908de6a22a60699bf1dc7b1227','john.box@niepodam.pl', True, '2', NULL, NOW()::timestamp, 0, False),
  ('tom.mustang', 'pbkdf2:sha256:150000\$utMSYg9u\$857da8b8a093e6a97573fdb223422e26dd0c449a171f030dba1a96beec03ebe0','tom.mustang@niepodam.pl', True, '2', NULL, NOW()::timestamp, 0, False),
  ('luk.brown', 'pbkdf2:sha256:150000\$8CitcuFJ\$7f26b71151731698cebc6a52be35d26c39203a1254f4ec4223de400e91b547cd','luk.brown@niepodam.pl', False, '2', NULL, NOW()::timestamp, 0, False);

  INSERT INTO "event" ("title", "details", "time_creation", "all_day_event", "time_event_start", "time_event_stop", "to_notify", "time_notify", "author_uid", "notification_sent", "is_active")
  VALUES ('Visit to the dentist', 'Tearing out three teeth. Doctor - John McDonald. Address - 132, Giant bird street', NOW()::timestamp - interval '2 days 2 hours', False, date_trunc('hour', NOW()::timestamp) + interval '2 days 2 hours', date_trunc('hour', NOW()::timestamp) + interval '2 days 2 hours', True, date_trunc('hour', NOW()::timestamp) + interval '1 day', 4, False, True),
  ('Visit to the vet', 'Vestibulum condimentum, enim vitae tempor malesuada, sem sem tempor erat, eget aliquam ex lectus at erat. Maecenas viverra blandit neque. Donec malesuada sed odio ut convallis.', NOW()::timestamp - interval '3 days 6 hours', False, date_trunc('hour', NOW()::timestamp) + interval '8 days 1 hours', date_trunc('hour', NOW()::timestamp) + interval '8 days 2 hours', True, date_trunc('hour', NOW()::timestamp) + interval '1 day', 8, False, True),
  ('Extension of car insurance','Aliquam et egestas enim. Nunc at nisl vitae libero sollicitudin luctus. Donec eu purus ipsum. Nam bibendum dictum dolor eu varius. Fusce quis purus consequat.', NOW()::timestamp - interval '1 days 5 hours', True, date_trunc('hour', NOW()::timestamp) + interval '10 days', date_trunc('hour', NOW()::timestamp) + interval '10 days 2 hours', True, date_trunc('hour', NOW()::timestamp) + interval '8 days',6, False, True),
  ('Journey to Sardinia','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non elit sed turpis pellentesque consectetur eget non nisl. Integer dignissim, orci ornare pretium gravida, odio arcu convallis.', NOW()::timestamp - interval '1 days 2 hours', True, date_trunc('hour', NOW()::timestamp) + interval '5 days 2 hours', date_trunc('hour', NOW()::timestamp) + interval '8 days', True, date_trunc('hour', NOW()::timestamp) + interval '3 days', 8, False, True),
  ('Red Hat System Administration I Course','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non elit sed turpis pellentesque consectetur eget non nisl. Integer dignissim, orci ornare pretium gravida, odio arcu convallis.', NOW()::timestamp - interval '10 days 2 hours', True, date_trunc('hour', NOW()::timestamp) + interval '3 days', date_trunc('hour', NOW()::timestamp) + interval '8 days', False, NULL, 5, True, True),
  ('Neque porro quisquam','Quisque facilisis venenatis nulla vulputate dictum. Cras aliquam sem sapien. Nam lobortis, erat ut porttitor sodales, sem urna sagittis turpis, quis venenatis nulla eros ac orci.', NOW()::timestamp, True,'2021-01-27 21:00:00.000000','2021-01-29 23:00:00.000000', True,'2021-01-24 23:00:00.000000', 2, True, True),
  ('Changing wheels in the car','Quisque facilisis venenatis nulla vulputate dictum. Cras aliquam sem sapien. Nam lobortis, erat ut porttitor sodales, sem urna sagittis turpis, quis venenatis nulla eros ac orci.', NOW()::timestamp, False,'2021-02-07 18:00:00.000000','2021-02-07 23:00:00.000000', True,'2021-01-24 23:00:00.000000', 6, True, True),
  ('Fridge repair','Morbi fermentum nisi eget sapien aliquam, sit amet rutrum sem scelerisque. Aliquam ultrices pretium nisl quis pharetra. Phasellus ultricies eros a.', NOW()::timestamp, False, '2021-02-11 19:00:00.000000', '2021-02-11 21:00:00.000000', True, '2021-01-24 23:00:00.000000', 9, True, True),
  ('Aliquam venenatis justo ultrices urna pellentesque ullamcorper.','Sed tristique ligula elit, eu tempor lectus consectetur sit amet. Curabitur tempus justo et massa fringilla, ut vestibulum magna ornare. Sed et libero erat. Ut vel mauris at lectus molestie consequat.', NOW()::timestamp, False, '2021-02-11 21:00:00.000000', '2021-02-12 03:00:00.000000', True, '2021-02-06 23:00:00.000000', 10, True, True),
  ('Japanese encephalitis vaccination','Duis congue, urna quis ullamcorper mattis, nisl elit blandit sem, ac tempor lorem diam at sem. Phasellus purus purus, euismod eget commodo a, semper eu quam. Ut in consequat metus, ut mattis leo. ', NOW()::timestamp, False, '2021-02-12 17:00:00.000000', '2021-02-12 21:00:00.000000', True, '2021-02-09 23:00:00.000000', 4, True, True),
  ('CCNA R&S Exam','Aenean commodo quam eget augue blandit aliquam. Cras ex diam, bibendum ac enim sed, iaculis sollicitudin sapien. ', NOW()::timestamp, False,'2021-02-03 20:00:00.000000','2021-02-03 23:00:00.000000', False, NULL, 2, True, True),
  ('CCNA CyberOPS Exam','Quisque vitae sapien imperdiet, porttitor leo ut, auctor nulla. Pellentesque eget ipsum fermentum, pellentesque lacus ut, pharetra ex.', NOW()::timestamp, False,'2021-02-10 15:00:00.000000','2021-02-10 19:00:00.000000', True, '2021-02-04 23:00:00.000000', 8, True, True),
  ('Excursion to Wejherowo','Estibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed efficitur nibh sit amet auctor consectetur. Proin tortor arcu, dapibus eu ornare sed, eleifend sed ligula.', NOW()::timestamp, False, '2021-02-24 23:00:00.000000', '2021-02-26 03:00:00.000000', True,'2021-02-18 23:00:00.000000',5, False, True),
  ('Netflix Marathon!','Remember to buy lots of crisps and beer. The Wither is coming!', NOW()::timestamp, False,'2021-02-10 01:00:00.000000','2021-02-13 03:00:00.000000', True,'2021-02-08 19:00:00.000000',7, True, True),
  ('Pay the bill for the accommodation!','Pellentesque a posuere sapien. Pellentesque nibh metus, posuere vitae sem vitae, varius pellentesque felis. Etiam laoreet cursus condimentum.', NOW()::timestamp, True,'2021-02-25 23:00:00.000000','2021-02-25 23:00:00.000000', True, '2021-02-24 03:00:00.000000', 2, False, True),
  ('Sekurak Hacking Party','Nulla eget libero a nulla malesuada scelerisque sed vel dolor. Nulla ut suscipit felis. Etiam euismod pellentesque lorem ac finibus. Vestibulum nulla enim, tincidunt id fringilla commodo, malesuada ut tellus.', NOW()::timestamp, False, '2021-02-25 20:00:00.000000', '2021-02-28 01:00:00.000000', True,'2021-01-31 19:00:00.000000',3, False, True),
  ('Water grandma''s flowers','Maecenas tempor leo dui, id posuere libero maximus at.', NOW()::timestamp, False,'2021-02-12 02:00:00.000000','2021-02-12 04:00:00.000000', True,'2021-02-11 22:11:00.000000', 7, False, True),
  ('Take the neighbor''s dog for a walk','Nulla ut suscipit felis. Etiam euismod pellentesque lorem ac finibus.', NOW()::timestamp, False,'2021-02-12 13:00:00.000000','2021-02-12 14:00:00.000000', True, '2021-02-11 23:14:00.000000', 6, False, True),
  ('Purchase materials for home improvement','Vestibulum nulla enim, tincidunt id fringilla commodo, malesuada ut tellus.', NOW()::timestamp, False,'2021-02-16 23:00:00.000000','2021-02-17 01:00:00.000000', True,'2021-02-11 23:17:00.000000', 9, False, True),
  ('Home NAS update','Nam libero metus, luctus quis bibendum lobortis, tristique a mauris. Pellentesque semper leo sit amet dolor semper iaculis. Donec tristique massa a tortor tempus finibus.', NOW()::timestamp, False,'2021-01-20 13:00:00.000000','2021-01-20 16:00:00.000000', True, '2021-01-20 07:11:00.000000',4, True, True),
  ('Lorem ipsum dolor sit amet','Cras molestie viverra dui in tincidunt. Vivamus scelerisque nunc in porta vestibulum.', NOW()::timestamp, True,'2021-01-21 23:00:00.000000','2021-01-23 23:00:00.000000', True, '2021-01-20 07:11:00.000000', 5, True, True),
  ('The oil change in the car','Fusce id dapibus sem, pellentesque ultrices orci. Pellentesque auctor odio sed lectus sagittis dapibus. Nam velit neque, accumsan ac dapibus vel, mattis vel ipsum. Mauris malesuada luctus velit, non vestibulum leo laoreet id.', NOW()::timestamp, True, '2021-02-02 23:00:00.000000', '2021-02-03 23:00:00.000000', False, NULL, 8, True, False),
  ('Payment for the VPS','Phasellus luctus tempus tortor, eu laoreet orci facilisis id. Suspendisse potenti. Maecenas bibendum nisi et dictum tempor.', NOW()::timestamp, True,'2021-02-20 23:00:00.000000','2021-02-21 23:00:00.000000', False, NULL, 9, True, False),
  ('BTC halving day','Maecenas bibendum nisi et dictum tempor.', NOW()::timestamp, True,'2021-02-02 23:00:00.000000','2021-02-03 23:00:00.000000', False,NULL,8, True, True),
  ('Dinner at the mother-in-law''s','Ut vitae vehicula mi. Proin ac quam ullamcorper, viverra orci vitae, laoreet tortor. Vestibulum lobortis, ligula in accumsan aliquet, lorem neque molestie orci, id maximus lorem augue nec erat.', NOW()::timestamp, False,'2021-02-23 08:00:00.000000', '2021-02-24 09:00:00.000000', True,'2021-02-20 01:11:00.000000', 2, False, True),
  ('Visit of a mother-in-law','Ut fringilla tortor ac finibus tincidunt. In sollicitudin ultrices leo, at vehicula nisl condimentum vitae. Maecenas placerat elit quis nisl fermentum semper. Aliquam sit amet massa vel massa consequat vestibulum nec at lorem.', NOW()::timestamp, False, '2021-02-04 22:00:00.000000','2021-02-06 21:00:00.000000', False, NULL, 7, True, False),
  ('Neque porro quisquam','Aliquam sit amet massa vel massa consequat vestibulum nec at lorem.', NOW()::timestamp, False,'2021-02-05 21:00:00.000000','2021-02-07 20:00:00.000000', False, NULL, 4, True, True),
  ('Ut vitae vehicula mi','Curabitur aliquet pretium leo sit amet auctor. Donec dapibus, neque eget ullamcorper malesuada, purus tellus posuere risus, a rutrum tortor lacus ac turpis.', NOW()::timestamp, False,'2021-01-29 19:00:00.000000','2021-01-31 22:00:00.000000', False,NULL, 10, True, True),
  ('Repairing garden furniture','Purus tellus posuere risus, a rutrum tortor lacus ac turpis.', NOW()::timestamp, False,'2021-02-04 20:00:00.000000','2021-02-05 11:00:00.000000', False, NULL, 10, True, True),
  ('Visit of the plumber','Purus tellus posuere risus, a rutrum tortor lacus ac turpis.', NOW()::timestamp, False,'2021-02-04 23:00:00.000000','2021-02-05 03:00:00.000000', False, NULL, 10, True, True),
  ('Business trip to Warsaw','Vestibulum lobortis, ligula in accumsan aliquet, lorem neque molestie orci, id maximus lorem augue nec erat.', NOW()::timestamp, True,'2021-02-20 23:00:00.000000','2021-02-22 23:00:00.000000', True,'2021-02-19 01:11:00.000000',2, True, True),
  ('Business trip to Zakopane','Ut hendrerit et lectus in dignissim. Quisque tristique odio leo, ut maximus justo dapibus ac. Pellentesque euismod velit arcu, sed venenatis ipsum tincidunt ac. Aliquam non gravida lorem.', NOW()::timestamp, True,'2021-02-23 23:00:00.000000','2021-02-25 23:00:00.000000', True,'2021-02-22 05:11:00.000000', 5, True, True),
  ('Test event',' Maecenas a lacus dapibus, consectetur quam et, auctor dui.', NOW()::timestamp, True,'2021-02-05 18:00:00.000000','2021-02-07 20:00:00.000000', False, NULL, 7, False, True);

  INSERT INTO "user_to_event" ("user_id", "event_id")
  VALUES (7, 1),
  (6, 1),
  (4, 1),
  (9, 2),
  (10, 2),
  (4, 3),
  (9, 3),
  (3, 3),
  (7, 4),
  (7, 5),
  (8, 6),
  (10, 7),
  (3, 7),
  (8, 7),
  (8, 8),
  (2, 9),
  (4, 9),
  (8, 10),
  (3, 10),
  (9, 11),
  (9, 12),
  (9, 13),
  (9, 14),
  (6, 14),
  (10, 14),
  (5, 15),
  (7, 16),
  (5, 16),
  (3, 16),
  (6, 17),
  (3, 17),
  (2, 17),
  (4, 18),
  (6, 19),
  (8, 19),
  (9, 20),
  (9, 21),
  (5, 22),
  (2, 22),
  (4, 23),
  (9, 24),
  (4, 25),
  (4, 26),
  (3, 27),
  (5, 27),
  (4, 28),
  (5, 29),
  (5, 30),
  (7, 30),
  (5, 31),
  (5, 32),
  (2, 33),
  (5, 33);
EOSQL
fi