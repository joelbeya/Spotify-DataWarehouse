------------------------------------------------------------------- REMPLISSAGE DATE_DIM -------------------------------------------------------------------------------------------

INSERT INTO DATE_DIM(
    DATE_KEY,
    FULL_DATE,
    DAY,
    MONTH,
    YEAR,
    SEASON,
    WEEKEND_INDICATOR,
    GIFT_PERIOD_INDICATOR
)
SELECT
    TO_CHAR(TO_DATE('31/12/2017','DD/MM/YYYY') + NUMTODSINTERVAL(n,'day'),'yyyymmdd'),
    TO_DATE('31/12/2017','DD/MM/YYYY') + NUMTODSINTERVAL(n,'day'),
    TO_CHAR(TO_DATE('31/12/2017','DD/MM/YYYY') + NUMTODSINTERVAL(n,'day'),'Dy'),
    TO_CHAR(TO_DATE('31/12/2017','DD/MM/YYYY') + NUMTODSINTERVAL(n,'day'),'Mon'),
    TO_CHAR(TO_DATE('31/12/2017','DD/MM/YYYY') + NUMTODSINTERVAL(n,'day'),'YYYY'),
    'NONE',
    'NO',
    'NO'
    FROM (
        SELECT level n
        FROM dual
        CONNECT BY level <= 312
);

------------------------------------------------------------------- REMPLISSAGE TIME_DIM -------------------------------------------------------------------------------------------

INSERT INTO TIME_DIM (
    TIME_KEY,
    TIME_DESC,
    TIME_IN24_NAME,
    TIME_HOUR24_MINUTE,
    TIME_HOUR_NAME,
    TIME_MINUTE_AMPM,
    TIME_HOUR,
    TIME_HOUR24,
    TIME_MINUTE,
    TIME_SECOND,
    TIME_AMPM_CODE
)
SELECT
    to_char(t, 'HH24MISS'),
    to_char(t, 'HH:MI:SS AM'),
    to_char(t, 'HH24:MI:SS'),
    to_char(t, 'HH24:MI'),
    to_char(t, 'HH AM'),
    to_char(t, 'HH:MI AM'),
    to_number(to_char(t, 'HH'), '00'),
    to_number(to_char(t, 'HH24'), '00'),
    to_number(to_char(t, 'MI'), '00'),
    to_number(to_char(t, 'SS'), '00'),
    to_char(t, 'AM')
    FROM (
        SELECT trunc(sysdate) + (level - 1)/86400 AS t
        FROM dual
        CONNECT BY level <= 86400
);

------------------------------------------------------------------ REMPLISSAGE USER_DIM -------------------------------------------------------------------------------------

INSERT INTO USER_DIM VALUES (1,'Christophe','christophe.quenette@etu-umontpellier.fr','M','31-Dec-1996','34000','Montpellier','France','Europe','NONE','ONEPLUS');
INSERT INTO USER_DIM VALUES (2,'Teiki','taiki.raihauti@etu-umontpellier.fr','M','25-Dec-1997','34000','Montpellier','France','Europe','NONE','SAMSUNG');
INSERT INTO USER_DIM VALUES (3,'Dareine','imrhan-dareine.minko-amoa@etu-umontpellier.fr','M','13-Mar-1998','34000','Montpellier','France','Europe','VISA','SAMSUNG');
INSERT INTO USER_DIM VALUES (4,'Joel','joel.beya@etu-umontpellier.fr','M','02-Jun-1994','34000','Montpellier','France','Europe','NONE','SAMSUNG');
INSERT INTO USER_DIM VALUES (5,'Federico','fe.Nunc@umontpellier.fr','M','06-Jun-1982','64144','Montpellier','France','Europe','VISA','IPHONE');
INSERT INTO USER_DIM VALUES (6,'Anne-Murielle','am@umontpellier.frt','F','21-Aug-1983','133372','Montpellier','France','Europe','VISA','IPHONE');
INSERT INTO USER_DIM VALUES (7,'Leonardo','sed@mitempor.ca','F','24-Jan-1984','523981','Cabo de Hornos','Chile','South-America','MASTERCARD','XIAOMI');
INSERT INTO USER_DIM VALUES (8,'Dimitri','Quisque@Nuncmauriselit.co.uk','F','04-Sep-1971','68714','Saint-Sébastien-sur-Loire','France','Europe','MASTERCARD','ALCATEL');
INSERT INTO USER_DIM VALUES (9,'Audra','id@pellentesquemassalobortis.edu','F','29-Jul-1967','T2W 0A2','Barrhead','Canada','North-America','GIFT CARD','XIAOMI');
INSERT INTO USER_DIM VALUES (10,'Keiko','aliquet.libero.Integer@ultriciessem.ca','F','27-Nov-1997','84383-038','Ponta Grossa','Brazil','South-America','GIFT CARD','NOKIA');
INSERT INTO USER_DIM VALUES (11,'Cody','ac.arcu@In.net','F','01-May-1985','7195','Seilles','Belgium','Europe','NONE','MOTOROLA');
INSERT INTO USER_DIM VALUES (12,'Olga','non@risusDonecegestas.ca','F','15-Jul-1993','4058','Sijsele','Belgium','Europe','VISA','NOKIA');
INSERT INTO USER_DIM VALUES (13,'Henry','magnis.dis.parturient@quamelementum.net','F','22-Dec-1978','64502','Gelsenkirchen','Germany','Europe','GIFT CARD','NONE');
INSERT INTO USER_DIM VALUES (14,'Maria','purus.accumsan@natoque.com','F','28-Sep-1991','72033','Falun','Sweden','Europe','VISA','MEIZU');
INSERT INTO USER_DIM VALUES (15,'Teagan','magna.Suspendisse@indolorFusce.net','F','02-Feb-1988','XF83 7RT','Beaumaris','United Kingdom','Europe','MASTERCARD','HUAWEI');
INSERT INTO USER_DIM VALUES (16,'Alexis','nisl.elementum@erategettincidunt.com','F','20-Jun-1996','28554','Wichita','United States','North-America','MASTERCARD','NONE');
INSERT INTO USER_DIM VALUES (17,'Martin','elementum.lorem@eunequepellentesque.edu','M','11-Dec-1991','28491','Dieppe','France','Europe','AMERICAN EXPRESS','NONE');
INSERT INTO USER_DIM VALUES (18,'Anita','hendrerit.neque@magnaSedeu.net','M','14-Aug-1966','JR22 2LK','Rochester','United Kingdom','Europe','MASTERCARD','HTC');
INSERT INTO USER_DIM VALUES (19,'Germane','lectus.pede@sedtortor.edu','M','06-Apr-1978','9071','Laakdal','Belgium','Europe','NONE','ALCATEL');
INSERT INTO USER_DIM VALUES (20,'Tanisha','euismod.mauris.eu@loremac.edu','M','27-Jan-1967','TB6 6RJ','Bodmin','United Kingdom','Europe','GIFT CARD','MOTOROLA');
INSERT INTO USER_DIM VALUES (21,'Delilah','ornare@scelerisquedui.co.uk','F','16-Sep-1966','7834','Haren','Belgium','Europe','NONE','ASUS');
INSERT INTO USER_DIM VALUES (22,'Germane','enim.nec.tempus@Nullamfeugiat.com','M','04-Jul-1986','4245','Chastre','Belgium','Europe','AMERICAN EXPRESS','BLACKBERRY');
INSERT INTO USER_DIM VALUES (23,'Jade','at@enim.ca','M','30-Dec-1983','37047','Vandoeuvre-lès-Nancy','France','Europe','GIFT CARD','WIKO');
INSERT INTO USER_DIM VALUES (24,'Alfonso','id.mollis@eulacus.edu','M','17-Jul-1985','60186','Rock Springs','United States','North-America','NONE','HTC');
INSERT INTO USER_DIM VALUES (25,'Adrien','mattis.ornare.lectus@Nam.com','F','06-Jun-2006','36902','Forbach','France','Europe','AMERICAN EXPRESS','HTC');
INSERT INTO USER_DIM VALUES (26,'Nomlanga','ut@sit.co.uk','M','17-Feb-2006','F43 8UR','Margate','United Kingdom','Europe','VISA','HTC');
INSERT INTO USER_DIM VALUES (27,'Aldair','est.ac.mattis@tortorNunccommodo.ca','M','27-Sep-1964','291251','Ñuñoa','Chile','South-America','AMERICAN EXPRESS','HTC');
INSERT INTO USER_DIM VALUES (28,'Rammohan','cursus@porttitortellus.com','M','04-Jul-1992','870003','Agartala','India','Asia','NONE','WIKO');
INSERT INTO USER_DIM VALUES (29,'Sandra','sollicitudin.a.malesuada@acturpis.net','M','09-Apr-2008','643666','Ijebu Ode','Nigeria','Africa','MASTERCARD','HTC');
INSERT INTO USER_DIM VALUES (30,'Malcolm','dictum.eu.placerat@duinecurna.net','M','20-Nov-1979','50318','Nicoya','Costa Rica','South-America','MASTERCARD','NOKIA');
INSERT INTO USER_DIM VALUES (31,'Jolene','sit.amet.consectetuer@Nam.co.uk','F','30-Aug-1968','84126','Waren','Germany','Europe','NONE','MOTOROLA');
INSERT INTO USER_DIM VALUES (32,'Nicholas','et.eros.Proin@metus.edu','M','22-Apr-2007','55862','Kapolei','United States','North-America','NONE','BQ');
INSERT INTO USER_DIM VALUES (33,'August','facilisis.facilisis.magna@elit.net','M','10-Mar-1992','00625','Bremerhaven','Germany','Europe','NONE','BQ');
INSERT INTO USER_DIM VALUES (34,'Martha','Aenean@ullamcorperviverra.org','F','15-Apr-1991','95748','Meißen','Germany','Europe','VISA','IPHONE');
INSERT INTO USER_DIM VALUES (35,'Sajal','Nunc@imperdietullamcorper.ca','F','21-Feb-1967','114767','Gangtok','India','Asia','MASTERCARD','NOKIA');
INSERT INTO USER_DIM VALUES (36,'Jameson','mauris.id@sitamet.edu','F','30-Dec-2007','X2B 6P0','Gjoa Haven','Canada','North-America','MASTERCARD','LG');
INSERT INTO USER_DIM VALUES (37,'Luna','massa.Suspendisse.eleifend@anteMaecenas.ca','F','26-Aug-2001','96218','Rodez','France','Europe','AMERICAN EXPRESS','MOTOROLA');
INSERT INTO USER_DIM VALUES (38,'Gisela','Aliquam.adipiscing.lobortis@Integer.net','F','13-Jan-1989','3594','Steendorp','Belgium','Europe','MASTERCARD','MOTOROLA');
INSERT INTO USER_DIM VALUES (39,'Anna','ornare.sagittis@tortorInteger.co.uk','M','24-Jan-1976','99229','Lidköping','Sweden','Europe','NONE','NOKIA');
INSERT INTO USER_DIM VALUES (40,'Karina','dolor.Nulla@Sedpharetra.org','M','08-Mar-2000','405655','Awka','Nigeria','Africa','GIFT CARD','IPHONE');
INSERT INTO USER_DIM VALUES (41,'Amena','euismod@convallisin.co.uk','F','13-Apr-1984','85122','Louisville','United States','North-America','MASTERCARD','ARCHOS');
INSERT INTO USER_DIM VALUES (42,'Jailekha','adipiscing.enim.mi@lobortisauguescelerisque.ca','F','08-Mar-1989','632379','Faridabad','India','Asia','MASTERCARD','LG');
INSERT INTO USER_DIM VALUES (43,'Vance','vehicula.Pellentesque@acfermentum.ca','F','05-Jul-1997','19240','Honolulu','United States','North-America','VISA','ASUS');
INSERT INTO USER_DIM VALUES (44,'Sigourney','id.ante@eudui.ca','M','30-Aug-2006','24228','Melilla','Spain','Europe','VISA','ZTE');
INSERT INTO USER_DIM VALUES (45,'Nero','enim.non@ut.ca','M','04-Jun-1974','279255','Okigwe','Nigeria','Africa','AMERICAN EXPRESS','ASUS');
INSERT INTO USER_DIM VALUES (46,'Chanyana','sed@ante.edu','F','08-Sep-1983','824594','Daman','India','Asia','MASTERCARD','HUAWEI');
INSERT INTO USER_DIM VALUES (47,'Maxence','lacus@euarcuMorbi.org','M','16-Apr-1990','69214','Rennes','France','Europe','AMERICAN EXPRESS','ALCATEL');
INSERT INTO USER_DIM VALUES (48,'Emerson','Integer.id.magna@enim.ca','F','02-Nov-1990','70467','Ribnitz-Damgarten','Germany','Europe','VISA','ZTE');
INSERT INTO USER_DIM VALUES (49,'Francesco','interdum.ligula@quis.net','F','21-Nov-2008','706096','Taltal','Chile','South-America','NONE','SAMSUNG');
INSERT INTO USER_DIM VALUES (50,'Madonna','consectetuer.adipiscing.elit@posuereat.edu','M','18-Nov-1965','44162','San Cristóbal de la Laguna','Spain','Europe','AMERICAN EXPRESS','XIAOMI');
INSERT INTO USER_DIM VALUES (51,'Ignacia','laoreet.posuere.enim@at.net','M','06-Dec-1993','383208','Lagos','Nigeria','Africa','GIFT CARD','ARCHOS');
INSERT INTO USER_DIM VALUES (52,'Daniel','molestie.orci@sedestNunc.edu','F','19-Dec-2008','L3X 3EF','Kirkintilloch','United Kingdom','Europe','AMERICAN EXPRESS','ALCATEL');
INSERT INTO USER_DIM VALUES (53,'Panchanan','neque.In.ornare@dolor.co.uk','F','16-Jan-1990','613469','Aizwal','India','Asia','GIFT CARD','HTC');
INSERT INTO USER_DIM VALUES (54,'Ahmed','lobortis@Maecenasmifelis.ca','F','14-May-1992','73775-474','Anápolis','Brazil','South-America','GIFT CARD','LG');
INSERT INTO USER_DIM VALUES (55,'Celeste','Proin.sed@erateget.co.uk','M','17-Apr-2002','75113','Görlitz','Germany','Europe','VISA','NOKIA');
INSERT INTO USER_DIM VALUES (56,'Kanaklata','et.eros@Crasconvallis.com','M','04-Oct-1964','823789','Berhampore','India','Asia','NONE','ZTE');
INSERT INTO USER_DIM VALUES (57,'Kirsten','libero@eleifendnondapibus.com','F','17-Jul-1971','60861-825','Fortaleza','Brazil','South-America','VISA','IPHONE');
INSERT INTO USER_DIM VALUES (58,'Wanda','non.lorem@vitae.edu','F','24-Sep-1973','H72 2VQ','Newtown','United Kingdom','Europe','GIFT CARD','HUAWEI');
INSERT INTO USER_DIM VALUES (59,'Cheyenne','purus@idmagna.net','F','27-Aug-1995','R2E 3W8','Beausejour','Canada','North-America','NONE','XIAOMI');
INSERT INTO USER_DIM VALUES (60,'Autumn','cursus.et@netus.co.uk','F','21-Feb-1975','339138','Awka','Nigeria','Africa','GIFT CARD','IPHONE');
INSERT INTO USER_DIM VALUES (61,'Nova','scelerisque@etcommodo.org','F','03-Apr-1976','82023-372','Londrina','Brazil','South-America','AMERICAN EXPRESS','NOKIA');
INSERT INTO USER_DIM VALUES (62,'Callum','malesuada@erat.net','M','05-Jun-1987','NY3 5XV','Maidenhead','United Kingdom','Europe','VISA','BQ');
INSERT INTO USER_DIM VALUES (63,'Arthur','sem@vulputatevelit.net','F','16-Apr-2009','47161','Aubervilliers','France','Europe','GIFT CARD','HTC');
INSERT INTO USER_DIM VALUES (64,'Indigo','massa.Mauris.vestibulum@orciPhasellus.edu','M','06-Aug-1980','56688','Remscheid','Germany','Europe','AMERICAN EXPRESS','HTC');
INSERT INTO USER_DIM VALUES (65,'Rhoda','purus.accumsan@felisDonectempor.org','F','07-Nov-1974','47993','Plauen','Germany','Europe','MASTERCARD','ARCHOS');
INSERT INTO USER_DIM VALUES (66,'Teegan','Quisque.imperdiet@tristique.net','M','27-Oct-2005','73387','Berlin','Germany','Europe','GIFT CARD','ASUS');
INSERT INTO USER_DIM VALUES (67,'Leonard','pellentesque@mitempor.co.uk','M','15-Jan-2003','A5X 6KD','Wrexham','United Kingdom','Europe','NONE','NONE');
INSERT INTO USER_DIM VALUES (68,'Horrace','massa.Vestibulum@libero.co.uk','F','04-Mar-2001','61771','Bamberg','Germany','Europe','VISA','LG');
INSERT INTO USER_DIM VALUES (69,'Kylan','accumsan@Duis.edu','F','02-Sep-1977','32468','Portland','United States','North-America','AMERICAN EXPRESS','HTC');
INSERT INTO USER_DIM VALUES (70,'Hop','rhoncus@Maurisblanditenim.net','M','26-Sep-1976','5228','Westmeerbeek','Belgium','Europe','AMERICAN EXPRESS','ONEPLUS');
INSERT INTO USER_DIM VALUES (71,'Sybill','arcu.Vestibulum@feugiatplacerat.net','F','12-Sep-1974','UZ6K 4SK','Torquay','United Kingdom','Europe','AMERICAN EXPRESS','ZTE');
INSERT INTO USER_DIM VALUES (72,'Henrik','ac.facilisis.facilisis@velvulputateeu.co.uk','M','25-Mar-1986','39202','Sandviken','Sweden','Europe','MASTERCARD','HTC');
INSERT INTO USER_DIM VALUES (73,'Reagan','a@estconguea.co.uk','F','16-Apr-2009','2578','Sint-Martens-Bodegem','Belgium','Europe','GIFT CARD','IPHONE');
INSERT INTO USER_DIM VALUES (74,'Apolo','tempus.eu.ligula@sapien.co.uk','M','17-Feb-1974','990415','Canela','Chile','South-America','VISA','SAMSUNG');
INSERT INTO USER_DIM VALUES (75,'Donna','ipsum@lacusCrasinterdum.co.uk','M','15-Jul-1984','58401-555','João Pessoa','Brazil','South-America','NONE','HTC');
INSERT INTO USER_DIM VALUES (76,'Imogene','molestie.sodales.Mauris@quistristiqueac.edu','M','10-Nov-1977','8122','Ukkel','Belgium','Europe','NONE','HUAWEI');
INSERT INTO USER_DIM VALUES (77,'Quentin','tincidunt.orci.quis@metusAliquamerat.edu','F','21-Sep-1980','486214','Dutse','Nigeria','Africa','MASTERCARD','ONEPLUS');
INSERT INTO USER_DIM VALUES (78,'Frances','enim.Sed@ipsum.org','F','24-Jul-1979','I0A 9WP','Kilsyth','United Kingdom','Europe','AMERICAN EXPRESS','MEIZU');
INSERT INTO USER_DIM VALUES (79,'Kalash','odio@Aliquamadipiscinglobortis.com','M','13-Jun-1965','464199','Delhi','India','Asia','MASTERCARD','IPHONE');
INSERT INTO USER_DIM VALUES (80,'Allistair','Nam.interdum.enim@etmagnis.co.uk','M','01-Aug-1985','5071','Etterbeek','Belgium','Europe','AMERICAN EXPRESS','LG');
INSERT INTO USER_DIM VALUES (81,'Carissa','dolor.tempus.non@Suspendisse.com','M','17-Oct-1983','58829-134','Sousa','Brazil','South-America','GIFT CARD','NOKIA');
INSERT INTO USER_DIM VALUES (82,'Rouse','at.pede@lacusQuisque.com','F','01-May-2007','535717','Paillaco','Chile','South-America','VISA','ARCHOS');
INSERT INTO USER_DIM VALUES (83,'Ishmael','sed.leo@nonegestasa.org','M','30-Mar-1974','8304','Vorst','Belgium','Europe','MASTERCARD','BLACKBERRY');
INSERT INTO USER_DIM VALUES (84,'Leo','non.justo.Proin@ametorciUt.net','M','14-Apr-1970','21506','Quesada','Costa Rica','South-America','MASTERCARD','WIKO');
INSERT INTO USER_DIM VALUES (85,'Noel','eleifend.egestas.Sed@pedeNuncsed.org','M','15-Dec-1978','042874','Coelemu','Chile','South-America','AMERICAN EXPRESS','ASUS');
INSERT INTO USER_DIM VALUES (86,'Barrett','dignissim.Maecenas.ornare@euismodurnaNullam.co.uk','M','05-Nov-1967','51412','Getafe','Spain','Europe','GIFT CARD','MOTOROLA');
INSERT INTO USER_DIM VALUES (87,'Märta','nascetur@nulla.co.uk','F','01-Oct-2004','76591','Sandviken','Sweden','Europe','AMERICAN EXPRESS','BQ');
INSERT INTO USER_DIM VALUES (88,'Rahly','vitae@Sed.com','F','27-Mar-1991','49867','Knoxville','United States','North-America','NONE','SAMSUNG');
INSERT INTO USER_DIM VALUES (89,'Dillon','tempor.erat@vitaeorci.ca','M','10-May-1964','75875','Des Moines','United States','North-America','AMERICAN EXPRESS','HUAWEI');
INSERT INTO USER_DIM VALUES (90,'Anais','Nam.nulla.magna@egestashendreritneque.co.uk','M','15-Aug-1965','98687','Sète','France','Europe','VISA','IPHONE');
INSERT INTO USER_DIM VALUES (91,'Cameron','Sed.molestie.Sed@Maurismolestie.org','M','08-Jan-2002','E6Z 0J3','Fredericton','Canada','North-America','AMERICAN EXPRESS','NONE');
INSERT INTO USER_DIM VALUES (92,'Yardley','Sed.congue.elit@eu.com','F','25-Mar-1988','X5K 3J8','Arviat','Canada','North-America','AMERICAN EXPRESS','XIAOMI');
INSERT INTO USER_DIM VALUES (93,'Aline','Quisque.purus.sapien@etrutrum.ca','F','05-May-1977','036934','Los Muermos','Chile','South-America','VISA','NOKIA');
INSERT INTO USER_DIM VALUES (94,'Carly','eu@odio.ca','M','16-Oct-2002','39561','Oviedo','Spain','Europe','AMERICAN EXPRESS','HUAWEI');
INSERT INTO USER_DIM VALUES (95,'Nissim','ultricies.ligula.Nullam@eu.edu','F','27-Oct-2005','4618','Borchtlombeek','Belgium','Europe','GIFT CARD','HUAWEI');
INSERT INTO USER_DIM VALUES (96,'Kanaklata','In.mi.pede@eget.net','F','07-Oct-1981','465320','Rajahmundry','India','Asia','MASTERCARD','IPHONE');
INSERT INTO USER_DIM VALUES (97,'Tanner','urna.justo.faucibus@duiaugue.org','M','07-Mar-1988','76730-113','Anápolis','Brazil','South-America','NONE','XIAOMI');
INSERT INTO USER_DIM VALUES (98,'Liberty','et.magnis@bibendumDonecfelis.org','F','08-May-1998','424866','Maiduguri','Nigeria','Africa','GIFT CARD','ONEPLUS');
INSERT INTO USER_DIM VALUES (99,'Akhila','mollis@velpedeblandit.org','M','13-Sep-1982','898714','Daman','India','Asia','MASTERCARD','WIKO');
INSERT INTO USER_DIM VALUES (100,'Angela','eu.metus.In@fermentumvelmauris.net','M','23-Mar-2009','99285','Idaho Falls','United States','North-America','NONE','SAMSUNG');
INSERT INTO USER_DIM VALUES (101,'Wanda','cursus.non@cursusInteger.com','M','30-Aug-2009','92771','Mexico','Mexico','North-America','AMERICAN EXPRESS','SAMSUNG');
INSERT INTO USER_DIM VALUES (102,'Jolene','lorem.vehicula.et@Vestibulumante.ca','M','09-May-1975','02841','Cancun','Mexico','North-America','GIFT CARD','NONE');
INSERT INTO USER_DIM VALUES (103,'Mason','dolor.sit@Quisque.net','F','01-Jan-2004','45006','Guadalajara','Mexico','North-America','GIFT CARD','SONY');
INSERT INTO USER_DIM VALUES (104,'Leah','volutpat@egetipsum.co.uk','M','02-Apr-1967','41233','Merida','Mexico','North-America','NONE','IPHONE');
INSERT INTO USER_DIM VALUES (105,'Grishka','augue.eu.tellus@dignissimtempor.org','M','28-Jun-2007','5360','Merida','Mexico','North-America','MASTERCARD','SONY');
INSERT INTO USER_DIM VALUES (106,'Yoshio','semper@Suspendisseac.net','M','18-Jul-1974','70315','Mexico','Mexico','North-America','GIFT CARD','SAMSUNG');
INSERT INTO USER_DIM VALUES (107,'Fletcher','justo.eu.arcu@nibhlacinia.ca','M','01-Jul-2001','87197','Puebla','Mexico','North-America','NONE','SONY');
INSERT INTO USER_DIM VALUES (108,'Merrill','Maecenas.iaculis@auctornunc.edu','F','02-Nov-1985','43818','Guadalajara','Mexico','North-America','NONE','SONY');
INSERT INTO USER_DIM VALUES (109,'Kevin','nulla.Integer.urna@arcu.com','F','14-Jan-1994','64770','Mexico','Mexico','North-America','MASTERCARD','SONY');
INSERT INTO USER_DIM VALUES (110,'Kaitlin','ante@ipsumcursus.org','F','15-May-1982','21398','Merida','Mexico','North-America','GIFT CARD','SAMSUNG');
INSERT INTO USER_DIM VALUES (111,'Pinguin','sem.consequat@nisl.com','F','07-Apr-1983','6933','Cancun','Mexico','North-America','GIFT CARD','SAMSUNG');
INSERT INTO USER_DIM VALUES (112,'Stephen','Integer.in.magna@Integertincidunt.edu','F','17-Jan-2006','4005','Guadalajara','Mexico','North-America','NONE','NONE');
INSERT INTO USER_DIM VALUES (113,'Aladdin','arcu@magnanec.edu','M','17-Aug-1983','721944','Cancun','Mexico','North-America','VISA','NONE');
INSERT INTO USER_DIM VALUES (114,'Ingrid','non.lobortis.quis@ridiculus.org','F','20-Sep-2002','505468','Acapulco','Mexico','North-America','VISA','SAMSUNG');
INSERT INTO USER_DIM VALUES (115,'Indigo','mauris.ipsum@euismodacfermentum.org','F','26-Jul-2003','3327 JY','Mexico','Mexico','North-America','VISA','IPHONE');
INSERT INTO USER_DIM VALUES (116,'Tana','Mauris.blandit.enim@ridiculusmusAenean.edu','M','11-Oct-1995','AY0 8EH','Puebla','Mexico','North-America','VISA','SAMSUNG');
INSERT INTO USER_DIM VALUES (117,'Lars','rhoncus.id.mollis@lectusNullamsuscipit.org','M','29-Jan-1965','66932','Puebla','Mexico','North-America','GIFT CARD','SONY');
INSERT INTO USER_DIM VALUES (118,'Yeo','risus@variusultrices.co.uk','M','18-Mar-2006','46780','Guadalajara','Mexico','North-America','GIFT CARD','SAMSUNG');
INSERT INTO USER_DIM VALUES (119,'Kyra','at.velit.Cras@aliquetdiamSed.co.uk','M','11-Jul-1984','04398','Puebla','Mexico','North-America','GIFT CARD','IPHONE');
INSERT INTO USER_DIM VALUES (120,'Nichole','magna.Cras@apurusDuis.net','F','20-Sep-1971','5513 QG','Cancun','Mexico','North-America','VISA','SONY');
INSERT INTO USER_DIM VALUES (121,'Diana','id.enim@et.org','F','06-Sep-1991','35204','Mexico','Mexico','North-America','AMERICAN EXPRESS','NONE');
INSERT INTO USER_DIM VALUES (122,'Stone','eleifend.vitae@eleifendvitae.com','M','01-Sep-2005','20216-479','Acapulco','Mexico','North-America','AMERICAN EXPRESS','NONE');
INSERT INTO USER_DIM VALUES (123,'Alden','in.faucibus.orci@Etiamgravida.net','M','18-Dec-2009','085629','Acapulco','Mexico','North-America','GIFT CARD','NONE');
INSERT INTO USER_DIM VALUES (124,'Lyle','Nulla.interdum.Curabitur@Aliquamnecenim.ca','F','06-Apr-1965','83-871','Merida','Mexico','North-America','NONE','NONE');
INSERT INTO USER_DIM VALUES (125,'Kasimir','mus@lectusNullamsuscipit.edu','F','28-Mar-1989','67741','Acapulco','Mexico','North-America','MASTERCARD','SAMSUNG');
INSERT INTO USER_DIM VALUES (126,'Ashely','natoque@metus.org','M','15-Aug-2007','5901','Cancun','Mexico','North-America','NONE','SONY');
INSERT INTO USER_DIM VALUES (127,'Jerry','sem.magna.nec@adipiscing.ca','M','16-Dec-1967','7865 TF','Cancun','Mexico','North-America','NONE','NONE');
INSERT INTO USER_DIM VALUES (128,'Haley','vitae@Sed.ca','M','19-Apr-1972','975178','Akuyeri','Iceland','Europe','MASTERCARD','ZTE');
INSERT INTO USER_DIM VALUES (129,'Rae','sem.magna.nec@aliquetodioEtiam.org','M','24-Sep-1973','42961','Vik i Myrdal','Iceland','Europe','MASTERCARD','NONE');
INSERT INTO USER_DIM VALUES (130,'Wilma','mauris.blandit@nequeNullamut.net','F','08-May-1995','424861','Kopavogur','Iceland','Europe','GIFT CARD','BQ');
INSERT INTO USER_DIM VALUES (131,'Kyubi','eleifend.vitae.erat@vulputateullamcorpermagna.org','M','11-Apr-2003','68030','Husavik','Iceland','Europe','GIFT CARD','SONY');
INSERT INTO USER_DIM VALUES (132,'Risa','Phasellus.dolor.elit@elit.edu','M','01-May-2000','72671','Kopavogur','Iceland','Europe','MASTERCARD','NONE');
INSERT INTO USER_DIM VALUES (133,'Damien','dui.semper.et@Innec.org','M','27-Jul-1994','66532-277','Husavik','Iceland','Europe','VISA','MOTOROLA');
INSERT INTO USER_DIM VALUES (134,'Palmer','lobortis.mauris.Suspendisse@Proin.net','M','28-Feb-1994','8388','Akuyeri','Iceland','Europe','AMERICAN EXPRESS','SONY');
INSERT INTO USER_DIM VALUES (135,'Evrard','vitae.aliquet.nec@tinciduntnibhPhasellus.net','M','05-Mar-1985','151310','Akuyeri','Iceland','Europe','VISA','SONY');
INSERT INTO USER_DIM VALUES (136,'Gary','tincidunt.dui.augue@sagittisaugue.co.uk','M','08-Oct-2003','1364','Kopavogur','Iceland','Europe','VISA','BQ');
INSERT INTO USER_DIM VALUES (137,'Gray','est.ac@ligula.com','M','21-Sep-1996','7107','Vik i Myrdal','Iceland','Europe','AMERICAN EXPRESS','NONE');
INSERT INTO USER_DIM VALUES (138,'Howard','Nunc.ut.erat@consequat.co.uk','F','13-Mar-1979','741781','Vik i Myrdal','Iceland','Europe','MASTERCARD','BQ');
INSERT INTO USER_DIM VALUES (139,'Damon','Donec.egestas@torquent.co.uk','F','16-Jun-1978','3640','Akuyeri','Iceland','Europe','NONE','SONY');
INSERT INTO USER_DIM VALUES (140,'Amber','iaculis.lacus.pede@Donec.net','M','07-Oct-1990','380329','Reykjavik','Iceland','Europe','GIFT CARD','MOTOROLA');
INSERT INTO USER_DIM VALUES (141,'Adrienne','sem.semper.erat@arcuac.net','M','24-Sep-1971','51425','Reykjavik','Iceland','Europe','GIFT CARD','MOTOROLA');
INSERT INTO USER_DIM VALUES (142,'Jerry','ipsum.primis@Proinvelnisl.co.uk','F','18-Oct-1967','X1P 2L8','Keflavik','Iceland','Europe','MASTERCARD','XIAOMI');
INSERT INTO USER_DIM VALUES (143,'Amela','nibh@loremauctor.org','F','29-Jul-1965','849271','Husavik','Iceland','Europe','NONE','SONY');
INSERT INTO USER_DIM VALUES (144,'Adrian','lacinia.at.iaculis@utpellentesqueeget.org','M','05-Dec-1969','SD97 6JJ','Husavik','Iceland','Europe','AMERICAN EXPRESS','XIAOMI');
INSERT INTO USER_DIM VALUES (145,'Emmanuel','tempor.augue.ac@Aeneaneuismod.org','M','24-Oct-1975','83167','Akuyeri','Iceland','Europe','NONE','ZTE');
INSERT INTO USER_DIM VALUES (146,'Xantha','a.enim@augueacipsum.net','M','23-Mar-1992','9581','Vik i Myrdal','Iceland','Europe','MASTERCARD','BQ');
INSERT INTO USER_DIM VALUES (147,'Jenette','ac.eleifend.vitae@Cum.co.uk','F','22-Mar-2009','25526','Vik i Myrdal','Iceland','Europe','AMERICAN EXPRESS','ZTE');
INSERT INTO USER_DIM VALUES (148,'Ciaran','interdum.enim.non@primis.ca','F','09-Feb-2006','Q5 8VL','Puebla','Mexico','North-America','VISA','SONY');
INSERT INTO USER_DIM VALUES (149,'Zaphina','ornare.libero.at@et.net','F','13-Jun-2005','9740','Piriapolis','Uruguay','South-America','NONE','NONE');
INSERT INTO USER_DIM VALUES (150,'Mikayla','In@acurna.org','M','20-Nov-1984','P0C 0A4','Salto','Uruguay','South-America','VISA','NONE');
INSERT INTO USER_DIM VALUES (151,'Stella','ut@nectempusmauris.edu','F','26-Jun-1997','0806','Montevideo','Uruguay','South-America','NONE','ONEPLUS');
INSERT INTO USER_DIM VALUES (152,'Lydia','quis@enim.edu','M','26-Aug-1967','9049','Rocha','Uruguay','South-America','GIFT CARD','IPHONE');
INSERT INTO USER_DIM VALUES (153,'Tad','Curabitur@ridiculus.edu','M','03-Nov-1991','11315','Punta del Este','Uruguay','South-America','VISA','ONEPLUS');
INSERT INTO USER_DIM VALUES (154,'Rigel','Nunc@necdiam.net','M','22-Jul-1981','9489','Salto','Uruguay','South-America','NONE','MEIZU');
INSERT INTO USER_DIM VALUES (155,'Calvin','et@ut.ca','F','25-Mar-1984','G2V 6N8','Montevideo','Uruguay','South-America','AMERICAN EXPRESS','MEIZU');
INSERT INTO USER_DIM VALUES (156,'Octavia','gravida@lobortisnisinibh.ca','M','17-Nov-2006','28-590','Rocha','Uruguay','South-America','VISA','IPHONE');
INSERT INTO USER_DIM VALUES (157,'Jarrod','dignissim@aodiosemper.ca','M','05-Aug-1995','9372','Montevideo','Uruguay','South-America','AMERICAN EXPRESS','NONE');
INSERT INTO USER_DIM VALUES (158,'Georgia','hendrerit.neque.In@porttitorvulputateposuere.edu','F','10-Dec-1988','11206','Punta del Este','Uruguay','South-America','MASTERCARD','IPHONE');
INSERT INTO USER_DIM VALUES (159,'Robin','Curabitur.massa.Vestibulum@Nullasemper.com','F','31-Aug-1981','90682','Colonia del Sacramento','Uruguay','South-America','MASTERCARD','SONY');
INSERT INTO USER_DIM VALUES (160,'Henry','vitae@pellentesque.net','M','28-Jun-1995','71883-697','Punta del Este','Uruguay','South-America','NONE','IPHONE');
INSERT INTO USER_DIM VALUES (161,'Cheryl','lorem.fringilla.ornare@Namtempor.co.uk','F','09-May-2007','255773','Piriapolis','Uruguay','South-America','AMERICAN EXPRESS','ONEPLUS');
INSERT INTO USER_DIM VALUES (162,'Sawyer','erat.semper.rutrum@anteipsumprimis.com','F','10-Jan-1998','958661','Piriapolis','Uruguay','South-America','AMERICAN EXPRESS','SONY');
INSERT INTO USER_DIM VALUES (163,'Rebecca','at@magnaNam.ca','M','29-Aug-1980','6927','Piriapolis','Uruguay','South-America','MASTERCARD','MEIZU');
INSERT INTO USER_DIM VALUES (164,'Bruce','amet@pharetranibhAliquam.org','F','24-Dec-1988','3305','Punta del Este','Uruguay','South-America','NONE','ONEPLUS');
INSERT INTO USER_DIM VALUES (165,'Kelly','mi.felis@Donectincidunt.org','M','28-Aug-1989','80596','Piriapolis','Uruguay','South-America','NONE','MEIZU');
INSERT INTO USER_DIM VALUES (166,'Oleg','orci.lobortis@ipsumdolorsit.org','M','05-Sep-2007','9564','Salto','Uruguay','South-America','MASTERCARD','SAMSUNG');
INSERT INTO USER_DIM VALUES (167,'Ivy','faucibus.Morbi@ut.com','M','05-Oct-1970','478805','Piriapolis','Uruguay','South-America','NONE','SONY');
INSERT INTO USER_DIM VALUES (168,'Sophia','congue.a.aliquet@at.co.uk','F','27-Nov-1978','1244','Piriapolis','Uruguay','South-America','AMERICAN EXPRESS','ONEPLUS');
INSERT INTO USER_DIM VALUES (169,'Tanisha','fermentum@luctusetultrices.edu','F','09-Jan-1992','46733','Colonia del Sacramento','Uruguay','South-America','MASTERCARD','ONEPLUS');
INSERT INTO USER_DIM VALUES (170,'Karleigh','a.mi@pedeNunc.co.uk','F','03-Feb-1979','2952','Salto','Uruguay','South-America','NONE','ONEPLUS');
INSERT INTO USER_DIM VALUES (171,'Zeph','Aliquam.erat.volutpat@ornaresagittis.ca','F','14-May-2005','53663','Rocha','Uruguay','South-America','AMERICAN EXPRESS','NONE');
INSERT INTO USER_DIM VALUES (172,'Yvette','Sed@augueidante.com','M','26-Sep-2005','70559','Piriapolis','Uruguay','South-America','AMERICAN EXPRESS','ONEPLUS');
INSERT INTO USER_DIM VALUES (173,'Olivia','bibendum.fermentum@sagittisaugue.edu','M','07-Jun-1998','23874','Punta del Este','Uruguay','South-America','VISA','IPHONE');
INSERT INTO USER_DIM VALUES (174,'Garfield','Curabitur.consequat.lectus@consectetuer.edu','F','05-Sep-2002','A5K 1A4','Rocha','Uruguay','South-America','AMERICAN EXPRESS','SAMSUNG');
INSERT INTO USER_DIM VALUES (175,'Grope','Nulla.tempor.augue@justoPraesent.net','M','02-Oct-1971','55160','Salto','Uruguay','South-America','GIFT CARD','SAMSUNG');
INSERT INTO USER_DIM VALUES (176,'Rashid','dictum.augue@Quisque.co.uk','F','23-Feb-1982','5026','Rocha','Uruguay','South-America','VISA','ONEPLUS');
INSERT INTO USER_DIM VALUES (177,'May','est.ac@accumsanneque.net','M','14-Aug-1973','26157','Montevideo','Uruguay','South-America','MASTERCARD','MOTOROLA');
INSERT INTO USER_DIM VALUES (178,'Rana','aliquet.metus.urna@Donecfelis.co.uk','F','23-Nov-1978','5135','Montevideo','Uruguay','South-America','VISA','HTC');
INSERT INTO USER_DIM VALUES (179,'Ramona','elit@necmetusfacilisis.com','F','19-Jun-2003','98701','Piriapolis','Uruguay','South-America','VISA','ONEPLUS');
INSERT INTO USER_DIM VALUES (180,'Isadora','et@egetnisidictum.edu','M','05-Jun-1974','9001','Salto','Uruguay','South-America','NONE','ONEPLUS');
INSERT INTO USER_DIM VALUES (181,'Noble','nulla.vulputate.dui@atvelitPellentesque.ca','F','18-Jan-2007','56831','Mendoza','Argentina','South-America','AMERICAN EXPRESS','IPHONE');
INSERT INTO USER_DIM VALUES (182,'Walker','scelerisque.mollis.Phasellus@consectetueradipiscing.com','F','17-Nov-1996','23424','Cordoba','Argentina','South-America','VISA','MEIZU');
INSERT INTO USER_DIM VALUES (183,'Isaac','est@dictumProineget.edu','F','24-May-1998','9889','Cordoba','Argentina','South-America','MASTERCARD','BQ');
INSERT INTO USER_DIM VALUES (184,'Gaara','sem.eget.massa@lectusconvallis.org','F','24-Apr-1989','7416 TV','Rosario','Argentina','South-America','MASTERCARD','ALCATEL');
INSERT INTO USER_DIM VALUES (185,'Hope','Cras@tincidunt.net','M','10-Dec-1974','V0 3JL','Salta','Argentina','South-America','GIFT CARD','BLACKBERRY');
INSERT INTO USER_DIM VALUES (186,'Plato','dictum@blandit.org','M','20-Dec-1986','2103 PO','Salta','Argentina','South-America','NONE','BLACKBERRY');
INSERT INTO USER_DIM VALUES (187,'Flavia','aliquet.molestie@tellussem.com','M','29-Apr-1992','5056','Rosario','Argentina','South-America','MASTERCARD','BQ');
INSERT INTO USER_DIM VALUES (188,'Dora','laoreet@enimsit.co.uk','M','06-Jun-1994','5148','Salta','Argentina','South-America','MASTERCARD','BQ');
INSERT INTO USER_DIM VALUES (189,'Lawrence','nec@lacusMaurisnon.co.uk','M','01-Dec-1977','40982','Rosario','Argentina','South-America','NONE','SAMSUNG');
INSERT INTO USER_DIM VALUES (190,'Gage','vel.sapien@tempor.edu','M','17-Dec-1998','74359','Mendoza','Argentina','South-America','NONE','SAMSUNG');
INSERT INTO USER_DIM VALUES (191,'Nathan','vehicula.risus.Nulla@euturpis.ca','M','09-Sep-1989','71010','Mendoza','Argentina','South-America','AMERICAN EXPRESS','BQ');
INSERT INTO USER_DIM VALUES (192,'Raya','erat.volutpat.Nulla@tempus.net','M','06-Mar-1977','56117','San Carlos de Baridoche','Argentina','South-America','AMERICAN EXPRESS','SAMSUNG');
INSERT INTO USER_DIM VALUES (193,'Tiger','interdum@dolor.ca','F','06-Mar-1979','K5W 4G7','Rosario','Argentina','South-America','AMERICAN EXPRESS','NONE');
INSERT INTO USER_DIM VALUES (194,'Reuben','mauris@atlibero.net','F','04-Nov-1997','05646','Cordoba','Argentina','South-America','AMERICAN EXPRESS','IPHONE');
INSERT INTO USER_DIM VALUES (195,'Maggie','Donec.tempor@commodohendrerit.edu','M','09-Nov-1974','38011','Rosario','Argentina','South-America','GIFT CARD','BLACKBERRY');
INSERT INTO USER_DIM VALUES (196,'Stone','cubilia.Curae@conubianostraper.edu','M','21-Aug-1984','899854','Salta','Argentina','South-America','VISA','BQ');
INSERT INTO USER_DIM VALUES (197,'Inga','Quisque@idrisus.net','F','03-May-1988','9226','Rosario','Argentina','South-America','VISA','BQ');
INSERT INTO USER_DIM VALUES (198,'Yoshimitsu','interdum.Sed.auctor@odioPhasellus.com','M','19-Oct-1985','1959','Buenos Aires','Argentina','South-America','MASTERCARD','SAMSUNG');
INSERT INTO USER_DIM VALUES (199,'Regan','vel@etmagna.edu','M','04-Feb-1982','96559','Rosario','Argentina','South-America','MASTERCARD','BQ');
INSERT INTO USER_DIM VALUES (200,'Thomas','Nunc.ullamcorper.velit@Sedmalesuadaaugue.edu','M','08-Sep-1986','33570','Cordoba','Argentina','South-America','MASTERCARD','BLACKBERRY');
INSERT INTO USER_DIM VALUES (201,'Declan','semper.pretium@turpisIn.co.uk','F','17-Nov-1991','8212 CU','Rosario','Argentina','South-America','MASTERCARD','IPHONE');
INSERT INTO USER_DIM VALUES (202,'Steel','lacus@estmollisnon.edu','M','10-Apr-1991','7498','Mendoza','Argentina','South-America','GIFT CARD','MEIZU');
INSERT INTO USER_DIM VALUES (203,'Florian','dolor.quam@QuisquevariusNam.com','M','11-Jul-1967','097518','Cordoba','Argentina','South-America','NONE','ARCHOS');
INSERT INTO USER_DIM VALUES (204,'Ivy','nec.tempus@Mauris.ca','M','15-Jul-2007','65531','Salta','Argentina','South-America','VISA','NONE');
INSERT INTO USER_DIM VALUES (205,'Dara','taciti.sociosqu.ad@malesuada.net','F','18-Sep-1996','064330','Buenos Aires','Argentina','South-America','NONE','ALCATEL');
INSERT INTO USER_DIM VALUES (206,'Joan','ligula.consectetuer@pellentesque.org','M','12-Feb-1995','99351-820','Salta','Argentina','South-America','AMERICAN EXPRESS','NONE');
INSERT INTO USER_DIM VALUES (207,'Chadwick','vitae@fermentumconvallis.org','M','04-Feb-2002','975858','Mendoza','Argentina','South-America','MASTERCARD','BQ');
INSERT INTO USER_DIM VALUES (208,'Aurore','dictum.Phasellus.in@Nulla.com','F','28-Feb-1992','1541','Rosario','Argentina','South-America','NONE','BQ');
INSERT INTO USER_DIM VALUES (209,'Brielle','bibendum@laciniaat.org','F','03-Apr-1977','3211','Rosario','Argentina','South-America','NONE','BQ');
INSERT INTO USER_DIM VALUES (210,'Austin','in@porttitor.org','M','12-Jul-1994','G4L 8Z1','Cordoba','Argentina','South-America','VISA','SAMSUNG');
INSERT INTO USER_DIM VALUES (211,'Hedwig','elementum.lorem.ut@Nulla.net','M','07-Oct-2009','616962','Cordoba','Argentina','South-America','GIFT CARD','NONE');
INSERT INTO USER_DIM VALUES (212,'Ann','Sed.nulla.ante@Phaselluslibero.com','M','10-Dec-1984','71947-400','San Carlos de Baridoche','Argentina','South-America','MASTERCARD','MEIZU');
INSERT INTO USER_DIM VALUES (213,'Bakugo','cursus.et@facilisiSed.org','M','08-Jul-1997','30115','Kobe','Japon','Asia','GIFT CARD','SAMSUNG');
INSERT INTO USER_DIM VALUES (214,'Jin','non.lorem.vitae@necurna.edu','M','23-Sep-1978','8256','Nagoya','Japon','Asia','GIFT CARD','SAMSUNG');
INSERT INTO USER_DIM VALUES (215,'Sylvester','euismod.enim@risusodio.com','F','09-Feb-2007','19710','Osaka','Japon','Asia','VISA','SAMSUNG');
INSERT INTO USER_DIM VALUES (216,'Melvin','vulputate@Aliquamadipiscing.co.uk','F','10-Mar-1999','GW46 3NB','Tokyo','Japon','Asia','MASTERCARD','SONY');
INSERT INTO USER_DIM VALUES (217,'Rachel','fringilla@elitafeugiat.com','F','23-May-1994','822797','Kobe','Japon','Asia','VISA','NONE');
INSERT INTO USER_DIM VALUES (218,'Vera','elementum@mauris.com','F','08-Jul-1980','158979','Nagoya','Japon','Asia','GIFT CARD','BQ');
INSERT INTO USER_DIM VALUES (219,'Keane','natoque.penatibus.et@faucibusorci.edu','F','25-Apr-2009','992993','Kobe','Japon','Asia','VISA','NONE');
INSERT INTO USER_DIM VALUES (220,'Hadassah','convallis.dolor.Quisque@consectetuer.net','M','19-Oct-1994','5975','Nagoya','Japon','Asia','MASTERCARD','IPHONE');
INSERT INTO USER_DIM VALUES (221,'Ezekiel','cursus.luctus.ipsum@sitamet.com','F','23-May-1991','207168','Kobe','Japon','Asia','AMERICAN EXPRESS','SONY');
INSERT INTO USER_DIM VALUES (222,'Clayton','elit.pretium.et@scelerisquesed.co.uk','F','20-Apr-1976','04511','Osaka','Japon','Asia','NONE','NONE');
INSERT INTO USER_DIM VALUES (223,'Lesley','porttitor@consequatpurusMaecenas.ca','M','21-Jun-1984','90240','Kyoto','Japon','Asia','AMERICAN EXPRESS','NONE');
INSERT INTO USER_DIM VALUES (224,'Gannon','felis.Nulla.tempor@nonummy.edu','F','28-Sep-2002','72825','Osaka','Japon','Asia','GIFT CARD','SONY');
INSERT INTO USER_DIM VALUES (225,'Dende','Vivamus@enimEtiamimperdiet.edu','M','03-Jul-1988','06692','Tokyo','Japon','Asia','MASTERCARD','SONY');
INSERT INTO USER_DIM VALUES (226,'Heidi','metus.sit.amet@Donecnibh.edu','M','07-Aug-2001','34860-042','Osaka','Japon','Asia','MASTERCARD','BLACKBERRY');
INSERT INTO USER_DIM VALUES (227,'Reece','Morbi.vehicula.Pellentesque@non.edu','F','20-Apr-1964','487769','Kyoto','Japon','Asia','AMERICAN EXPRESS','SONY');
INSERT INTO USER_DIM VALUES (228,'Mallory','lectus.justo@Etiam.com','M','27-Feb-1996','04770-416','Tokyo','Japon','Asia','AMERICAN EXPRESS','ASUS');
INSERT INTO USER_DIM VALUES (229,'Melinda','Integer.eu.lacus@tristiqueneque.org','F','27-Jun-1979','039161','Kyoto','Japon','Asia','MASTERCARD','ASUS');
INSERT INTO USER_DIM VALUES (230,'Benjamin','a.aliquet.vel@Suspendissealiquet.com','F','21-May-2002','70911','Osaka','Japon','Asia','NONE','MEIZU');
INSERT INTO USER_DIM VALUES (231,'Gwendolyn','Donec@ultrices.ca','M','07-Jan-1979','5372','Nagoya','Japon','Asia','VISA','SAMSUNG');
INSERT INTO USER_DIM VALUES (232,'Seth','sagittis@pede.com','M','16-Aug-1994','5758','Nagoya','Japon','Asia','GIFT CARD','SAMSUNG');
INSERT INTO USER_DIM VALUES (233,'Ella','eget.metus.In@eu.edu','M','12-Aug-1972','X4H 1WC','Tokyo','Japon','Asia','MASTERCARD','SONY');
INSERT INTO USER_DIM VALUES (234,'Victoria','non.egestas.a@nunc.edu','F','16-Mar-1987','63593','Kyoto','Japon','Asia','MASTERCARD','BLACKBERRY');
INSERT INTO USER_DIM VALUES (235,'Abra','Etiam@placeratorci.edu','F','17-Sep-1999','29230','Kyoto','Japon','Asia','GIFT CARD','MEIZU');
INSERT INTO USER_DIM VALUES (236,'Aspen','adipiscing.ligula.Aenean@metus.edu','F','06-Jun-1966','61205','Kobe','Japon','Asia','NONE','SAMSUNG');
INSERT INTO USER_DIM VALUES (237,'Britney','ut@consequat.net','M','27-Jun-1974','7894','Osaka','Japon','Asia','AMERICAN EXPRESS','ASUS');
INSERT INTO USER_DIM VALUES (238,'Kato','auctor@montes.ca','F','08-Oct-2003','07188','Tokyo','Japon','Asia','AMERICAN EXPRESS','SAMSUNG');
INSERT INTO USER_DIM VALUES (239,'Devin','tellus.Phasellus@Vivamusnibh.edu','F','28-Apr-1964','40330','Kyoto','Japon','Asia','VISA','BLACKBERRY');
INSERT INTO USER_DIM VALUES (240,'Tanner','Aenean.egestas.hendrerit@magnisdisparturient.co.uk','F','06-Jan-1992','V8K 6B0','Kobe','Japon','Asia','GIFT CARD','IPHONE');
INSERT INTO USER_DIM VALUES (241,'Hadley','risus.quis.diam@metus.co.uk','M','17-Dec-1986','75435','Kyoto','Japon','Asia','NONE','IPHONE');
INSERT INTO USER_DIM VALUES (242,'Laurel','nec@Nullam.net','M','20-Oct-1975','48-383','Hiroshima','Japon','Asia','NONE','BQ');
INSERT INTO USER_DIM VALUES (243,'Shaine','nascetur.ridiculus@Sed.ca','M','18-Apr-1973','4241','Nagoya','Japon','Asia','GIFT CARD','SONY');
INSERT INTO USER_DIM VALUES (244,'Jolie','ipsum.primis@convalliserat.ca','F','07-Feb-1990','405669','Tokyo','Japon','Asia','AMERICAN EXPRESS','ASUS');
INSERT INTO USER_DIM VALUES (245,'Sawyer','Vestibulum@eget.org','M','31-Aug-1986','50105','Hiroshima','Japon','Asia','VISA','IPHONE');
INSERT INTO USER_DIM VALUES (246,'Kane','at.libero.Morbi@Nulla.com','M','19-Mar-1986','82971','Osaka','Japon','Asia','AMERICAN EXPRESS','SONY');
INSERT INTO USER_DIM VALUES (247,'Flynn','auctor@eueleifend.com','M','18-Jun-1972','95833','Osaka','Japon','Asia','MASTERCARD','MEIZU');
INSERT INTO USER_DIM VALUES (248,'Kathleen','massa.lobortis.ultrices@nonlacinia.com','F','10-Mar-1998','2944','Kobe','Japon','Asia','VISA','MEIZU');
INSERT INTO USER_DIM VALUES (249,'Connor','montes.nascetur.ridiculus@lacusvestibulumlorem.com','F','02-Oct-2004','74532','Kyoto','Japon','Asia','VISA','NONE');
INSERT INTO USER_DIM VALUES (250,'Ava','felis.orci.adipiscing@nec.edu','M','30-Jul-1979','21675','Osaka','Japon','Asia','VISA','ASUS');
INSERT INTO USER_DIM VALUES (251,'Yondaime','Nunc.sed@mollis.ca','F','04-Jun-1984','87479-498','Hiroshima','Japon','Asia','NONE','SAMSUNG');
INSERT INTO USER_DIM VALUES (252,'Kamal','enim.sit.amet@euismodmauris.ca','F','28-Nov-1988','30306','Kobe','Japon','Asia','VISA','BQ');
INSERT INTO USER_DIM VALUES (253,'Raja','mi@at.com','F','22-Jan-1977','62-502','Tokyo','Japon','Asia','VISA','BQ');
INSERT INTO USER_DIM VALUES (254,'Orson','penatibus.et.magnis@diamluctuslobortis.com','M','06-Feb-1980','663310','Kyoto','Japon','Asia','MASTERCARD','ASUS');
INSERT INTO USER_DIM VALUES (255,'Zane','Phasellus@montes.edu','M','19-Apr-1985','21211','Osaka','Japon','Asia','MASTERCARD','ASUS');
INSERT INTO USER_DIM VALUES (256,'Gemma','sapien.Aenean.massa@vitaenibhDonec.com','M','12-May-2005','45055','Kyoto','Japon','Asia','GIFT CARD','ASUS');
INSERT INTO USER_DIM VALUES (257,'Karen','erat.vel@faucibusleo.edu','M','20-Dec-2005','0842 YR','Osaka','Japon','Asia','AMERICAN EXPRESS','ASUS');
INSERT INTO USER_DIM VALUES (258,'Rinah','Aenean@ac.edu','F','01-Nov-2008','74740','Kyoto','Japon','Asia','VISA','SAMSUNG');
INSERT INTO USER_DIM VALUES (259,'Flavi','augue.id.ante@non.ca','F','28-Jul-1974','5294','Kobe','Japon','Asia','VISA','IPHONE');
INSERT INTO USER_DIM VALUES (260,'Kyla','nec.eleifend@Sednulla.org','M','18-Sep-1997','50536','Hiroshima','Japon','Asia','GIFT CARD','BQ');
INSERT INTO USER_DIM VALUES (261,'Amity','egestas@vitaeerat.net','M','28-Nov-2007','98505','Nagoya','Japon','Asia','VISA','SONY');
INSERT INTO USER_DIM VALUES (262,'Caryn','Morbi.vehicula@ornare.co.uk','M','30-Mar-2003','167393','Hiroshima','Japon','Asia','NONE','SONY');
INSERT INTO USER_DIM VALUES (263,'Nora','eget.metus.In@arcuNunc.ca','F','25-Dec-1983','7904','Kobe','Japon','Asia','AMERICAN EXPRESS','SONY');
INSERT INTO USER_DIM VALUES (264,'Marah','nulla.ante@imperdiet.edu','M','31-Aug-2005','4339','Kyoto','Japon','Asia','NONE','NOKIA');
INSERT INTO USER_DIM VALUES (265,'Dante','ornare.lectus.ante@dictumeu.co.uk','M','21-Sep-2003','5191 ZV','Kyoto','Japon','Asia','GIFT CARD','ASUS');
INSERT INTO USER_DIM VALUES (266,'Rama','enim@Nullam.org','F','09-Apr-1993','67134','Hiroshima','Japon','Asia','VISA','SAMSUNG');
INSERT INTO USER_DIM VALUES (267,'Tad','nunc.est.mollis@Donectempuslorem.net','F','28-Jun-1991','087506','Tokyo','Japon','Asia','GIFT CARD','BLACKBERRY');
INSERT INTO USER_DIM VALUES (268,'Jordan','montes.nascetur.ridiculus@ametrisusDonec.com','M','22-Oct-1996','94322','Pekin','Chine','Asia','VISA','LG');
INSERT INTO USER_DIM VALUES (269,'Walter','vel@euaccumsansed.co.uk','F','17-Aug-1974','4238','Pekin','Chine','Asia','VISA','MEIZU');
INSERT INTO USER_DIM VALUES (270,'Shay','ipsum@ultrices.co.uk','F','24-Sep-2003','9048','Pekin','Chine','Asia','MASTERCARD','LG');
INSERT INTO USER_DIM VALUES (271,'Graiden','odio.Etiam.ligula@nequeMorbi.co.uk','F','26-Aug-1976','24058','Pekin','Chine','Asia','VISA','XIAOMI');
INSERT INTO USER_DIM VALUES (272,'Blythe','non@elit.net','M','16-Mar-1988','60574','Chongqing','Chine','Asia','VISA','NOKIA');
INSERT INTO USER_DIM VALUES (273,'Nola','Proin.non@Utsagittislobortis.co.uk','M','29-Apr-2007','24384','Shenzhen','Chine','Asia','NONE','HTC');
INSERT INTO USER_DIM VALUES (274,'Gigas','eu@auctorvitaealiquet.com','F','11-Apr-1973','81153','Pekin','Chine','Asia','NONE','BQ');
INSERT INTO USER_DIM VALUES (275,'Driscoll','ipsum.Phasellus.vitae@malesuadaiderat.co.uk','M','26-May-1994','V9 0FS','Pekin','Chine','Asia','GIFT CARD','BQ');
INSERT INTO USER_DIM VALUES (276,'Yoshio','Proin.eget.odio@sociisnatoque.net','M','06-Feb-1964','53101','Canton','Chine','Asia','NONE','ASUS');
INSERT INTO USER_DIM VALUES (277,'Seth','neque.In.ornare@vitae.edu','M','13-Sep-1990','60-539','Pekin','Chine','Asia','VISA','NOKIA');
INSERT INTO USER_DIM VALUES (278,'Sylvia','Nunc.ullamcorper.velit@atlacus.co.uk','M','20-May-1966','053889','Canton','Chine','Asia','NONE','NOKIA');
INSERT INTO USER_DIM VALUES (279,'Theodore','eget.dictum.placerat@cursus.org','M','09-Nov-1990','4650','Tianjin','Chine','Asia','AMERICAN EXPRESS','MEIZU');
INSERT INTO USER_DIM VALUES (280,'Orla','penatibus.et.magnis@risusodio.net','F','09-Apr-1964','23-437','Shenzhen','Chine','Asia','GIFT CARD','BQ');
INSERT INTO USER_DIM VALUES (281,'Preston','vehicula@euismodacfermentum.co.uk','F','03-Apr-1969','3365','Canton','Chine','Asia','AMERICAN EXPRESS','NONE');
INSERT INTO USER_DIM VALUES (282,'Bo','Donec.egestas.Aliquam@blanditenim.co.uk','M','02-Apr-1976','675657','Pekin','Chine','Asia','VISA','MOTOROLA');
INSERT INTO USER_DIM VALUES (283,'Clinton','nunc.ac.mattis@nisi.edu','F','30-Sep-2005','66200','Canton','Chine','Asia','GIFT CARD','MEIZU');
INSERT INTO USER_DIM VALUES (284,'Gavin','tempus@nibhlaciniaorci.ca','F','09-Jun-1980','VT34 9ED','Pekin','Chine','Asia','AMERICAN EXPRESS','LG');
INSERT INTO USER_DIM VALUES (285,'Blaze','risus.Morbi.metus@dictummi.org','F','26-Jul-1965','8547','Pekin','Chine','Asia','VISA','SAMSUNG');
INSERT INTO USER_DIM VALUES (286,'Dubois','adipiscing.elit.Etiam@libero.co.uk','M','14-Aug-1967','91024','Tianjin','Chine','Asia','GIFT CARD','SAMSUNG');
INSERT INTO USER_DIM VALUES (287,'Rogan','In.scelerisque@ornare.edu','F','19-Feb-2008','BX6N 6XP','Tianjin','Chine','Asia','NONE','SAMSUNG');
INSERT INTO USER_DIM VALUES (288,'Baki','nibh.Phasellus.nulla@purusMaecenas.ca','M','15-Apr-2005','3955','Shangai','Chine','Asia','MASTERCARD','NOKIA');
INSERT INTO USER_DIM VALUES (289,'Quynn','vulputate.lacus@acipsumPhasellus.com','F','11-Jun-1984','70407','Chongqing','Chine','Asia','NONE','IPHONE');
INSERT INTO USER_DIM VALUES (290,'Ignatius','lacus.vestibulum.lorem@maurisut.com','F','07-Apr-1973','42718','Chongqing','Chine','Asia','NONE','ASUS');
INSERT INTO USER_DIM VALUES (291,'Maryam','dolor.egestas.rhoncus@magnaSed.co.uk','F','27-Nov-1995','64589','Canton','Chine','Asia','GIFT CARD','MOTOROLA');
INSERT INTO USER_DIM VALUES (292,'Winter','consectetuer.ipsum.nunc@mi.org','M','20-May-1977','957133','Pekin','Chine','Asia','AMERICAN EXPRESS','HTC');
INSERT INTO USER_DIM VALUES (293,'Violet','ac@blanditatnisi.net','F','09-May-1977','63353','Shangai','Chine','Asia','VISA','SAMSUNG');
INSERT INTO USER_DIM VALUES (294,'Camden','vel@pellentesque.edu','M','16-Sep-1970','336652','Shangai','Chine','Asia','VISA','HTC');
INSERT INTO USER_DIM VALUES (295,'Lyle','tempor@mipedenonummy.net','M','12-Jan-1974','94285','Shenzhen','Chine','Asia','MASTERCARD','NOKIA');
INSERT INTO USER_DIM VALUES (296,'Cruz','quis.lectus.Nullam@neque.org','M','11-Aug-2003','6477 CH','Shenzhen','Chine','Asia','VISA','SAMSUNG');
INSERT INTO USER_DIM VALUES (297,'Stewart','dapibus.ligula@eleifendCrassed.ca','M','06-Sep-1978','70268','Shangai','Chine','Asia','NONE','NONE');
INSERT INTO USER_DIM VALUES (298,'Joshua','Proin.non@tellus.ca','M','05-Sep-1986','P7A 0S6','Chongqing','Chine','Asia','MASTERCARD','XIAOMI');
INSERT INTO USER_DIM VALUES (299,'Jameson','blandit.congue@tortorNunccommodo.ca','M','10-May-1999','81785','Chongqing','Chine','Asia','AMERICAN EXPRESS','HTC');
INSERT INTO USER_DIM VALUES (300,'Eva','augue.ut.lacus@odio.edu','F','10-Mar-2004','31410','Chongqing','Chine','Asia','GIFT CARD','HTC');
INSERT INTO USER_DIM VALUES (301,'Ashton','arcu.Aliquam.ultrices@ipsumCurabitur.edu','M','30-Sep-2001','98508','Shenzhen','Chine','Asia','MASTERCARD','MOTOROLA');
INSERT INTO USER_DIM VALUES (302,'Ingrid','ultricies@Phasellusvitaemauris.co.uk','F','02-Dec-1979','6765 RD','Shenzhen','Chine','Asia','VISA','ASUS');
INSERT INTO USER_DIM VALUES (303,'Noelani','mauris@sem.org','M','03-Sep-1981','26369','Shenzhen','Chine','Asia','NONE','LG');
INSERT INTO USER_DIM VALUES (304,'Chester','accumsan.neque.et@risusIn.co.uk','F','18-Sep-2008','50058-673','Pekin','Chine','Asia','AMERICAN EXPRESS','ASUS');
INSERT INTO USER_DIM VALUES (305,'Dominic','ornare.Fusce.mollis@vestibulum.net','F','02-Apr-1995','987394','Shenzhen','Chine','Asia','MASTERCARD','NOKIA');
INSERT INTO USER_DIM VALUES (306,'Aiko','diam.luctus.lobortis@disparturient.ca','F','18-Nov-2006','1610','Tianjin','Chine','Asia','VISA','HTC');
INSERT INTO USER_DIM VALUES (307,'Madeline','tristique.pellentesque@luctussit.co.uk','F','22-Jun-2003','615258','Shenzhen','Chine','Asia','GIFT CARD','LG');
INSERT INTO USER_DIM VALUES (308,'Madaline','leo.in.lobortis@egetmassa.org','M','16-Jul-2004','41813','Canton','Chine','Asia','VISA','MEIZU');
INSERT INTO USER_DIM VALUES (309,'Aquila','blandit.congue@bibendumullamcorper.edu','F','04-Jan-2001','FD4 2SS','Chongqing','Chine','Asia','AMERICAN EXPRESS','HTC');
INSERT INTO USER_DIM VALUES (310,'Walker','torquent.per.conubia@vitaemauris.org','M','24-May-1969','81490-972','Chongqing','Chine','Asia','AMERICAN EXPRESS','HTC');
INSERT INTO USER_DIM VALUES (311,'Deborah','ut.erat@sitamet.com','M','03-May-1996','95067','Canton','Chine','Asia','MASTERCARD','LG');
INSERT INTO USER_DIM VALUES (312,'Eric','ridiculus.mus@interdumCurabitur.co.uk','F','11-Feb-1997','3175','Tianjin','Chine','Asia','AMERICAN EXPRESS','ZTE');
INSERT INTO USER_DIM VALUES (313,'Alec','natoque.penatibus.et@nonummy.edu','F','05-Apr-1974','6185','Canton','Chine','Asia','NONE','MEIZU');
INSERT INTO USER_DIM VALUES (314,'Hakeem','sit.amet@Duisdignissim.ca','F','26-Jul-1971','2964','Pekin','Chine','Asia','NONE','SAMSUNG');
INSERT INTO USER_DIM VALUES (315,'Irma','aliquet@semconsequatnec.net','M','07-Mar-1999','DO0 5PH','Canton','Chine','Asia','NONE','ASUS');
INSERT INTO USER_DIM VALUES (316,'Ramona','ultrices.mauris.ipsum@morbitristique.org','F','10-Apr-1986','980865','Tianjin','Chine','Asia','VISA','MOTOROLA');
INSERT INTO USER_DIM VALUES (317,'Josie','interdum.Curabitur.dictum@placeratvelite.ca','F','30-Jan-1974','259423','Shangai','Chine','Asia','MASTERCARD','MEIZU');
INSERT INTO USER_DIM VALUES (318,'Bernard','in.cursus.et@fames.ca','F','03-Jan-1972','R8K 5T5','Canton','Chine','Asia','MASTERCARD','SAMSUNG');
INSERT INTO USER_DIM VALUES (319,'Orson','quis.diam.Pellentesque@enimNunc.edu','M','16-Apr-1976','43670','Chongqing','Chine','Asia','MASTERCARD','NONE');
INSERT INTO USER_DIM VALUES (320,'Bradley','pede.Cum@Inatpede.com','F','28-Jan-2001','110308','Shangai','Chine','Asia','VISA','MOTOROLA');
INSERT INTO USER_DIM VALUES (321,'Mannix','sed.dolor.Fusce@metusurna.com','F','12-May-1995','174674','Shenzhen','Chine','Asia','NONE','HTC');
INSERT INTO USER_DIM VALUES (322,'Aretha','Integer.sem@quis.ca','F','17-Aug-1965','76489-266','Pekin','Chine','Asia','MASTERCARD','LG');
INSERT INTO USER_DIM VALUES (323,'Tate','Donec.egestas@nec.org','M','04-Dec-2004','42399','Pekin','Chine','Asia','GIFT CARD','MOTOROLA');
INSERT INTO USER_DIM VALUES (324,'Nicholas','diam@acmattisvelit.co.uk','F','15-Feb-1990','89100','Shenzhen','Chine','Asia','MASTERCARD','BQ');
INSERT INTO USER_DIM VALUES (325,'Carlito','vulputate@eu.net','M','19-Jul-1995','507384','Shenzhen','Chine','Asia','MASTERCARD','BQ');
INSERT INTO USER_DIM VALUES (326,'Illana','et@vehiculaPellentesquetincidunt.net','M','21-May-1990','QN3A 5JP','Tianjin','Chine','Asia','VISA','HUAWEI');
INSERT INTO USER_DIM VALUES (327,'Len','pellentesque.tellus@mi.edu','M','22-May-2007','0708','Shenzhen','Chine','Asia','GIFT CARD','HUAWEI');
INSERT INTO USER_DIM VALUES (328,'Izuku','Integer.eu.lacus@Duisacarcu.edu','F','21-Aug-1975','46309','Shangai','Chine','Asia','NONE','BQ');
INSERT INTO USER_DIM VALUES (329,'Riley','dui.augue.eu@metus.ca','M','17-Feb-1992','6905','Pekin','Chine','Asia','NONE','MOTOROLA');
INSERT INTO USER_DIM VALUES (330,'Miriam','accumsan.convallis.ante@fringillapurusmauris.net','M','05-Jul-2009','35866','Shenzhen','Chine','Asia','MASTERCARD','LG');
INSERT INTO USER_DIM VALUES (331,'Kalia','tempor@mattisIntegereu.co.uk','F','11-Jan-1978','5816','Shangai','Chine','Asia','VISA','ZTE');
INSERT INTO USER_DIM VALUES (332,'Curtis','tellus@nullaante.ca','M','16-Jan-1988','93667-123','Tianjin','Chine','Asia','GIFT CARD','HTC');
INSERT INTO USER_DIM VALUES (333,'Kenneth','eu@velarcueu.com','M','09-Apr-1984','51384','Shangai','Chine','Asia','VISA','HTC');
INSERT INTO USER_DIM VALUES (334,'Colleen','tristique.senectus@dictumultriciesligula.co.uk','F','16-Sep-1968','4382','Pekin','Chine','Asia','AMERICAN EXPRESS','MOTOROLA');
INSERT INTO USER_DIM VALUES (335,'Uriah','libero.mauris.aliquam@velitSed.co.uk','M','07-Jul-1996','9290','Chongqing','Chine','Asia','AMERICAN EXPRESS','XIAOMI');
INSERT INTO USER_DIM VALUES (336,'Deirdre','urna.et.arcu@infelis.org','M','12-Aug-1988','66338','Tianjin','Chine','Asia','VISA','ASUS');
INSERT INTO USER_DIM VALUES (337,'Jakeem','adipiscing@atpedeCras.co.uk','M','23-May-1973','17953','Canton','Chine','Asia','GIFT CARD','XIAOMI');
INSERT INTO USER_DIM VALUES (338,'Orson','sem.molestie@et.co.uk','M','04-Feb-1981','3717','Pekin','Chine','Asia','VISA','ASUS');
INSERT INTO USER_DIM VALUES (339,'Olympia','fermentum.metus.Aenean@feugiatSednec.net','F','17-Feb-1972','57652','Shangai','Chine','Asia','GIFT CARD','IPHONE');
INSERT INTO USER_DIM VALUES (340,'Alonzo','neque.Nullam@feugiatSed.co.uk','F','27-Nov-1992','20890','Chongqing','Chine','Asia','NONE','HTC');
INSERT INTO USER_DIM VALUES (341,'Balou','mauris.Suspendisse@massa.ca','M','18-Dec-1970','58025','Canton','Chine','Asia','GIFT CARD','MEIZU');
INSERT INTO USER_DIM VALUES (342,'Rashad','non.lorem@Morbinonsapien.org','M','08-Apr-1969','9486','Pekin','Chine','Asia','VISA','HUAWEI');
INSERT INTO USER_DIM VALUES (343,'Shad','mauris.sagittis@incursuset.co.uk','M','22-Aug-1993','39611','Shangai','Chine','Asia','MASTERCARD','IPHONE');
INSERT INTO USER_DIM VALUES (344,'Dorothy','purus.sapien.gravida@Nullam.ca','M','31-Jan-1987','72998','Pekin','Chine','Asia','NONE','MOTOROLA');
INSERT INTO USER_DIM VALUES (345,'Carla','egestas.hendrerit.neque@adipiscing.org','F','13-Aug-2006','73876','Shenzhen','Chine','Asia','GIFT CARD','BQ');
INSERT INTO USER_DIM VALUES (346,'Luke','non.dapibus@Nam.edu','M','25-Dec-1997','34011-921','Chongqing','Chine','Asia','GIFT CARD','IPHONE');
INSERT INTO USER_DIM VALUES (347,'Audrey','eu.turpis.Nulla@amet.co.uk','M','19-Sep-1995','5741','Tianjin','Chine','Asia','AMERICAN EXPRESS','SONY');
INSERT INTO USER_DIM VALUES (348,'Dawn','laoreet.libero.et@Suspendisseacmetus.ca','M','08-Aug-2003','42178','Chongqing','Chine','Asia','AMERICAN EXPRESS','IPHONE');
INSERT INTO USER_DIM VALUES (349,'Hall','purus@musProin.com','F','05-Jun-2000','0218','Shangai','Chine','Asia','VISA','LG');
INSERT INTO USER_DIM VALUES (350,'Edan','blandit.viverra@augue.com','M','28-Apr-1965','9442 MF','Shangai','Chine','Asia','AMERICAN EXPRESS','IPHONE');
INSERT INTO USER_DIM VALUES (351,'Karyn','eget@dignissim.edu','M','29-Dec-1976','04387','Shenzhen','Chine','Asia','VISA','MEIZU');
INSERT INTO USER_DIM VALUES (352,'Thomas','Nunc.mauris@tinciduntorciquis.co.uk','M','22-Oct-1977','22052','Pekin','Chine','Asia','AMERICAN EXPRESS','XIAOMI');
INSERT INTO USER_DIM VALUES (353,'Todd','elit.sed.consequat@quisarcuvel.net','M','18-Sep-1964','17400','Chongqing','Chine','Asia','AMERICAN EXPRESS','ASUS');
INSERT INTO USER_DIM VALUES (354,'Charde','ligula.Aliquam.erat@et.co.uk','M','04-Aug-1977','495851','Shangai','Chine','Asia','AMERICAN EXPRESS','IPHONE');
INSERT INTO USER_DIM VALUES (355,'Rowan','aliquam@libero.edu','M','16-Jul-2007','99-491','Shangai','Chine','Asia','NONE','XIAOMI');
INSERT INTO USER_DIM VALUES (356,'Giacomo','ante@urna.com','F','28-Jun-1976','7412','Shenzhen','Chine','Asia','VISA','XIAOMI');
INSERT INTO USER_DIM VALUES (357,'Arsenio','Aliquam.erat.volutpat@Donecsollicitudinadipiscing.com','F','02-Nov-2000','11397','Chongqing','Chine','Asia','NONE','SAMSUNG');
INSERT INTO USER_DIM VALUES (358,'Keefe','Quisque.libero.lacus@id.co.uk','F','12-Aug-1967','61918','Chongqing','Chine','Asia','MASTERCARD','BQ');
INSERT INTO USER_DIM VALUES (359,'Ifeoma','scelerisque@sed.net','F','25-Jun-1965','289830','Daegu','South Korea','Asia','VISA','IPHONE');
INSERT INTO USER_DIM VALUES (360,'Shafira','sollicitudin.adipiscing@tinciduntnibh.co.uk','M','11-Sep-1987','54-234','Gwangju','South Korea','Asia','MASTERCARD','MOTOROLA');
INSERT INTO USER_DIM VALUES (361,'Yasir','ornare.placerat.orci@acurna.edu','M','05-Oct-1984','3493','Gyeongju','South Korea','Asia','AMERICAN EXPRESS','XIAOMI');
INSERT INTO USER_DIM VALUES (362,'Keefe','iaculis@dignissimlacusAliquam.edu','M','06-Aug-2005','85105-160','Punsan','South Korea','Asia','MASTERCARD','MOTOROLA');
INSERT INTO USER_DIM VALUES (363,'Lynn','nec.malesuada@Integer.com','M','25-Oct-1968','21314','Gwangju','South Korea','Asia','VISA','ASUS');
INSERT INTO USER_DIM VALUES (364,'Xander','sit.amet.consectetuer@bibendumDonecfelis.com','F','12-Sep-1981','6165','Punsan','South Korea','Asia','NONE','NONE');
INSERT INTO USER_DIM VALUES (365,'Annie','sociis@Fusce.co.uk','F','14-Feb-1971','89378','Seoul','South Korea','Asia','MASTERCARD','IPHONE');
INSERT INTO USER_DIM VALUES (366,'Arsenik','nunc.sit@ametconsectetuer.org','F','13-Jan-1968','42330','Incheon','South Korea','Asia','MASTERCARD','SAMSUNG');
INSERT INTO USER_DIM VALUES (367,'Garrett','eros@dignissimMaecenas.com','M','15-Aug-1999','07689','Incheon','South Korea','Asia','NONE','HTC');
INSERT INTO USER_DIM VALUES (368,'Zachary','Ut.tincidunt.orci@et.com','F','06-Mar-1976','00418','Seoul','South Korea','Asia','MASTERCARD','HTC');
INSERT INTO USER_DIM VALUES (369,'Keaton','Donec.luctus.aliquet@non.net','M','13-Mar-1986','2918','Seoul','South Korea','Asia','VISA','HTC');
INSERT INTO USER_DIM VALUES (370,'Sloane','Cras@diamSeddiam.net','F','11-Oct-1966','I2C 5WY','Gyeongju','South Korea','Asia','AMERICAN EXPRESS','MOTOROLA');
INSERT INTO USER_DIM VALUES (371,'Travis','sit@sit.ca','M','21-Oct-1972','9618','Punsan','South Korea','Asia','VISA','ASUS');
INSERT INTO USER_DIM VALUES (372,'Amir','quis.pede.Suspendisse@Duissitamet.co.uk','M','10-Oct-1972','337216','Incheon','South Korea','Asia','MASTERCARD','HUAWEI');
INSERT INTO USER_DIM VALUES (373,'Danilo','vitae.sodales@Cumsociis.com','F','23-Feb-1991','T8X 6R3','Daegu','South Korea','Asia','GIFT CARD','MOTOROLA');
INSERT INTO USER_DIM VALUES (374,'Dalila','morbi@eget.ca','M','13-Mar-1972','603444','Seoul','South Korea','Asia','VISA','ASUS');
INSERT INTO USER_DIM VALUES (375,'Finn','enim.Etiam.imperdiet@quismassa.ca','M','24-Feb-1966','428417','Gyeongju','South Korea','Asia','NONE','NONE');
INSERT INTO USER_DIM VALUES (376,'Karleigh','Cras@maurisutmi.co.uk','M','28-Sep-1981','21-969','Punsan','South Korea','Asia','NONE','HTC');
INSERT INTO USER_DIM VALUES (377,'Bruno','enim@sed.org','M','30-Nov-1970','613044','Incheon','South Korea','Asia','MASTERCARD','HTC');
INSERT INTO USER_DIM VALUES (378,'Rebecca','Nulla.facilisi.Sed@Donectemporest.net','M','18-Sep-2003','0237','Gwangju','South Korea','Asia','GIFT CARD','XIAOMI');
INSERT INTO USER_DIM VALUES (379,'Kevyn','risus.quis.diam@ullamcorperDuis.net','F','26-Mar-1984','62645','Gyeongju','South Korea','Asia','AMERICAN EXPRESS','LG');
INSERT INTO USER_DIM VALUES (380,'Cherokee','Sed@Sed.org','M','02-Aug-2007','78627','Incheon','South Korea','Asia','VISA','MOTOROLA');
INSERT INTO USER_DIM VALUES (381,'Martena','dignissim@felisorci.co.uk','F','14-Mar-2000','70011','Seoul','South Korea','Asia','VISA','ASUS');
INSERT INTO USER_DIM VALUES (382,'Makoto','Sed@nibhsitamet.ca','M','22-Oct-1999','44175','Gwangju','South Korea','Asia','VISA','MOTOROLA');
INSERT INTO USER_DIM VALUES (383,'Amal','non.arcu.Vivamus@felisegetvarius.net','M','05-Sep-1974','21524','Seoul','South Korea','Asia','MASTERCARD','LG');
INSERT INTO USER_DIM VALUES (384,'April','eros.Nam@interdumenimnon.org','F','24-Mar-1972','567074','Incheon','South Korea','Asia','MASTERCARD','XIAOMI');
INSERT INTO USER_DIM VALUES (385,'Gabriel','rhoncus.Nullam.velit@Vestibulumut.org','M','02-Jun-1996','60900','Punsan','South Korea','Asia','NONE','SAMSUNG');
INSERT INTO USER_DIM VALUES (386,'Hammett','arcu.Curabitur.ut@atlibero.edu','F','10-Oct-1996','594065','Seoul','South Korea','Asia','NONE','HUAWEI');
INSERT INTO USER_DIM VALUES (387,'Ainsley','turpis@enimcommodo.edu','M','23-Nov-2007','48-651','Gyeongju','South Korea','Asia','AMERICAN EXPRESS','NONE');
INSERT INTO USER_DIM VALUES (388,'Eaton','Praesent.eu@viverraMaecenasiaculis.co.uk','F','15-Jan-1992','LC9 2QZ','Incheon','South Korea','Asia','AMERICAN EXPRESS','ASUS');
INSERT INTO USER_DIM VALUES (389,'Denise','Integer.aliquam@iaculisenim.org','M','27-Feb-2004','7106','Seoul','South Korea','Asia','VISA','LG');
INSERT INTO USER_DIM VALUES (390,'Quincy','odio@nonlacinia.ca','F','31-Jul-1995','986936','Seoul','South Korea','Asia','AMERICAN EXPRESS','IPHONE');
INSERT INTO USER_DIM VALUES (391,'Gretchen','est.vitae@semper.org','F','31-Jul-1981','60169','Gyeongju','South Korea','Asia','GIFT CARD','MOTOROLA');
INSERT INTO USER_DIM VALUES (392,'Hedley','sociosqu.ad@Maurismagna.com','F','04-Dec-1979','071480','Daegu','South Korea','Asia','VISA','XIAOMI');
INSERT INTO USER_DIM VALUES (393,'Alexandra','Nam@convallisest.ca','M','25-Jul-1977','33846','Gwangju','South Korea','Asia','VISA','MOTOROLA');
INSERT INTO USER_DIM VALUES (394,'Germaine','nisl@sodales.com','F','03-Jul-1975','59290-640','Punsan','South Korea','Asia','NONE','MOTOROLA');
INSERT INTO USER_DIM VALUES (395,'Libby','amet@duiFuscediam.net','F','11-Jun-1972','69781','Gwangju','South Korea','Asia','VISA','SAMSUNG');
INSERT INTO USER_DIM VALUES (396,'Zane','imperdiet@lacus.com','F','09-Jan-1996','84867','Gwangju','South Korea','Asia','MASTERCARD','LG');
INSERT INTO USER_DIM VALUES (397,'Gillian','lacus.Nulla@cursusNunc.org','M','22-Jul-2009','33420','Punsan','South Korea','Asia','AMERICAN EXPRESS','IPHONE');
INSERT INTO USER_DIM VALUES (398,'Candace','mollis.Phasellus@ametlorem.edu','F','17-Aug-1997','22294','Incheon','South Korea','Asia','GIFT CARD','XIAOMI');
INSERT INTO USER_DIM VALUES (399,'Sophia','pede.Praesent.eu@Crasvehicula.net','M','30-Oct-1978','98644','Gwangju','South Korea','Asia','AMERICAN EXPRESS','ASUS');
INSERT INTO USER_DIM VALUES (400,'Hector','vitae.sodales.at@Phasellus.com','F','02-Apr-1971','P1K 9L3','Daegu','South Korea','Asia','NONE','IPHONE');
INSERT INTO USER_DIM VALUES (401,'Hayden','neque.In.ornare@Duisacarcu.edu','M','12-Jan-2005','230353','Seoul','South Korea','Asia','VISA','ASUS');
INSERT INTO USER_DIM VALUES (402,'Dean','adipiscing.Mauris@nunc.com','M','11-Jul-1969','30105','Gyeongju','South Korea','Asia','NONE','NONE');
INSERT INTO USER_DIM VALUES (403,'Rahim','facilisis@Nunccommodoauctor.edu','M','26-Sep-1979','85012','Seoul','South Korea','Asia','NONE','MOTOROLA');
INSERT INTO USER_DIM VALUES (404,'Merrill','nulla.magna.malesuada@ultricesiaculis.net','F','14-Aug-1965','03797','Daegu','South Korea','Asia','GIFT CARD','SAMSUNG');
INSERT INTO USER_DIM VALUES (405,'Hedda','in@etmagnisdis.net','F','24-Oct-1985','74678','Punsan','South Korea','Asia','AMERICAN EXPRESS','IPHONE');
INSERT INTO USER_DIM VALUES (406,'Gisela','massa.rutrum.magna@amet.edu','M','24-Dec-1982','92720','Punsan','South Korea','Asia','GIFT CARD','IPHONE');
INSERT INTO USER_DIM VALUES (407,'Iola','vehicula.risus@Cum.edu','M','26-Apr-1977','5086','Punsan','South Korea','Asia','NONE','NONE');
INSERT INTO USER_DIM VALUES (408,'Cudell','turpis@ipsum.co.uk','M','17-Aug-1985','J4B 6Y7','Incheon','South Korea','Asia','MASTERCARD','IPHONE');
INSERT INTO USER_DIM VALUES (409,'Jamal','lacus.Aliquam.rutrum@quamdignissim.com','F','24-Dec-2008','1280','Gwangju','South Korea','Asia','NONE','LG');
INSERT INTO USER_DIM VALUES (410,'Lael','enim@DonecegestasAliquam.net','M','23-Sep-1977','14-002','Pattaya','Thailand','Asia','NONE','NONE');
INSERT INTO USER_DIM VALUES (411,'Tanek','ipsum@sagittislobortis.edu','F','03-Sep-2009','T4Z 9H9','Chiang Mai','Thailand','Asia','MASTERCARD','ARCHOS');
INSERT INTO USER_DIM VALUES (412,'Abraham','semper@eleifendCras.co.uk','F','29-Dec-1973','54724','Bangkok','Thailand','Asia','VISA','ARCHOS');
INSERT INTO USER_DIM VALUES (413,'Leroy','et@nisiCum.ca','M','11-Oct-2002','3166','Hua Hin','Thailand','Asia','VISA','NONE');
INSERT INTO USER_DIM VALUES (414,'Jamalia','diam.at.pretium@Proinultrices.co.uk','F','19-Oct-1964','89326','Hua Hin','Thailand','Asia','MASTERCARD','HTC');
INSERT INTO USER_DIM VALUES (415,'Guinevere','feugiat.placerat.velit@lectus.net','F','14-Aug-1969','896976','Bangkok','Thailand','Asia','GIFT CARD','LG');
INSERT INTO USER_DIM VALUES (416,'Draven','sem.mollis.dui@Mauris.org','M','17-Jun-1964','693206','Bangkok','Thailand','Asia','NONE','BQ');
INSERT INTO USER_DIM VALUES (417,'Camille','libero.Proin@loremlorem.net','F','09-Jun-2008','62249','Chiang Mai','Thailand','Asia','MASTERCARD','HTC');
INSERT INTO USER_DIM VALUES (418,'Norman','dolor@consectetueradipiscing.edu','F','21-Jul-1969','4662','Chiang Rai','Thailand','Asia','VISA','NONE');
INSERT INTO USER_DIM VALUES (419,'David','Mauris@pretiumneque.edu','M','13-Sep-2004','40912','Bangkok','Thailand','Asia','GIFT CARD','LG');
INSERT INTO USER_DIM VALUES (420,'Ave','consequat@ultriciesdignissimlacus.edu','F','24-Jul-1983','55051','Hua Hin','Thailand','Asia','MASTERCARD','NONE');
INSERT INTO USER_DIM VALUES (421,'Judah','Mauris.ut@facilisisfacilisismagna.com','F','23-Mar-1990','10212','Chiang Mai','Thailand','Asia','AMERICAN EXPRESS','IPHONE');
INSERT INTO USER_DIM VALUES (422,'Francesca','lectus.a.sollicitudin@blanditmattisCras.edu','F','08-May-1966','79282','Hua Hin','Thailand','Asia','VISA','BQ');
INSERT INTO USER_DIM VALUES (423,'Raven','feugiat.placerat.velit@nunc.co.uk','F','11-Jan-2001','139693','Hua Hin','Thailand','Asia','GIFT CARD','HTC');
INSERT INTO USER_DIM VALUES (424,'Garce','Praesent@Aliquamgravida.org','M','15-Oct-1968','38960','Hua Hin','Thailand','Asia','MASTERCARD','ONEPLUS');
INSERT INTO USER_DIM VALUES (425,'Mason','In.mi@Aliquam.com','M','15-Dec-1977','10717','Chiang Mai','Thailand','Asia','VISA','ONEPLUS');
INSERT INTO USER_DIM VALUES (426,'Kristen','sed.libero.Proin@Maecenasmalesuadafringilla.net','M','30-Mar-1971','71903','Bangkok','Thailand','Asia','VISA','LG');
INSERT INTO USER_DIM VALUES (427,'Ebon','velit@elitAliquam.edu','M','13-May-1993','26042-694','Chiang Rai','Thailand','Asia','GIFT CARD','BQ');
INSERT INTO USER_DIM VALUES (428,'Nicole','erat@arcuVestibulumut.co.uk','F','15-Feb-1965','52447','Pattaya','Thailand','Asia','MASTERCARD','LG');
INSERT INTO USER_DIM VALUES (429,'Anthony','ultrices.sit.amet@inaliquet.ca','F','11-Feb-1998','9839','Bangkok','Thailand','Asia','AMERICAN EXPRESS','NONE');
INSERT INTO USER_DIM VALUES (430,'Ivory','nonummy.ut@eget.com','M','10-Jun-1975','5567 BG','Pattaya','Thailand','Asia','VISA','ARCHOS');
INSERT INTO USER_DIM VALUES (431,'Lucy','rhoncus@arcuimperdiet.edu','F','06-Apr-1964','62850','Chiang Mai','Thailand','Asia','GIFT CARD','SAMSUNG');
INSERT INTO USER_DIM VALUES (432,'Elton','nulla.Cras@pellentesqueeget.net','M','22-Jan-1994','50-341','Chiang Rai','Thailand','Asia','MASTERCARD','BQ');
INSERT INTO USER_DIM VALUES (433,'Kenyon','at.fringilla.purus@tellusPhaselluselit.ca','M','08-Aug-1991','039509','Ayutthaya','Thailand','Asia','VISA','LG');
INSERT INTO USER_DIM VALUES (434,'Jade','Morbi@nisi.com','F','07-May-2005','82720','Hua Hin','Thailand','Asia','NONE','ARCHOS');
INSERT INTO USER_DIM VALUES (435,'Blair','faucibus.lectus@convallis.com','F','01-Jan-1983','56124-807','Pattaya','Thailand','Asia','VISA','LG');
INSERT INTO USER_DIM VALUES (436,'Yangji','Sed.eu@ametorci.net','M','27-May-1991','61849','Ayutthaya','Thailand','Asia','NONE','BQ');
INSERT INTO USER_DIM VALUES (437,'Robert','tellus@sit.edu','M','27-Apr-2009','C6X 6T8','Chiang Mai','Thailand','Asia','AMERICAN EXPRESS','SAMSUNG');
INSERT INTO USER_DIM VALUES (438,'Ivory','nascetur.ridiculus@PhasellusnullaInteger.com','F','25-Mar-1983','104760','Ayutthaya','Thailand','Asia','VISA','IPHONE');
INSERT INTO USER_DIM VALUES (439,'Cole','ridiculus.mus.Aenean@quispede.co.uk','F','06-Apr-1965','74872','Pattaya','Thailand','Asia','GIFT CARD','LG');
INSERT INTO USER_DIM VALUES (440,'Jocelyn','lacus.Mauris.non@malesuadaaugue.org','M','07-Jan-2006','77439','Hua Hin','Thailand','Asia','NONE','IPHONE');
INSERT INTO USER_DIM VALUES (441,'Dai','conubia.nostra@Integer.edu','M','19-Feb-1997','96882','Ayutthaya','Thailand','Asia','NONE','HTC');
INSERT INTO USER_DIM VALUES (442,'Shellie','lectus@liberolacusvarius.edu','M','15-Jul-1968','3386','Bangkok','Thailand','Asia','GIFT CARD','IPHONE');
INSERT INTO USER_DIM VALUES (443,'Adara','Nulla@nisinibhlacinia.edu','F','18-Feb-1970','R79 2TR','Bangkok','Thailand','Asia','AMERICAN EXPRESS','IPHONE');
INSERT INTO USER_DIM VALUES (444,'Myles','non.feugiat@Loremipsumdolor.edu','M','30-May-2008','78552','Hua Hin','Thailand','Asia','GIFT CARD','IPHONE');
INSERT INTO USER_DIM VALUES (445,'Cadman','Vivamus@Suspendisse.ca','F','26-Dec-1984','59055','Chiang Rai','Thailand','Asia','VISA','LG');
INSERT INTO USER_DIM VALUES (446,'Demetrius','urna.suscipit@necorci.org','M','12-Jan-2004','9195','Chiang Mai','Thailand','Asia','AMERICAN EXPRESS','ONEPLUS');
INSERT INTO USER_DIM VALUES (447,'Sean','amet@facilisisloremtristique.org','M','03-Jul-1968','42529','Chiang Mai','Thailand','Asia','NONE','BQ');
INSERT INTO USER_DIM VALUES (448,'Nina','eget@Morbiquisurna.net','F','15-Jan-1967','55-107','Chiang Rai','Thailand','Asia','MASTERCARD','HTC');
INSERT INTO USER_DIM VALUES (449,'Cullen','euismod.mauris@gravidanunc.net','M','28-Oct-2008','2929','Hua Hin','Thailand','Asia','NONE','HTC');
INSERT INTO USER_DIM VALUES (450,'Maya','lacus.varius@porttitor.org','F','08-Apr-1986','47267','Franceville','Gabon','Africa','VISA','BLACKBERRY');
INSERT INTO USER_DIM VALUES (451,'Kylie','odio.Nam.interdum@velit.edu','F','09-Apr-2009','41937','Port-Gentil','Gabon','Africa','AMERICAN EXPRESS','LG');
INSERT INTO USER_DIM VALUES (452,'Ursula','Vivamus@lorem.net','F','03-Nov-2002','2722 TE','Kango','Gabon','Africa','VISA','XIAOMI');
INSERT INTO USER_DIM VALUES (453,'Darrel','ridiculus@vulputateeu.net','M','21-Apr-2003','DH7Q 3EK','Moanda','Gabon','Africa','VISA','LG');
INSERT INTO USER_DIM VALUES (454,'Brenda','dolor@dis.com','F','18-Oct-2005','7995 MH','Libreville','Gabon','Africa','AMERICAN EXPRESS','IPHONE');
INSERT INTO USER_DIM VALUES (455,'Guinevere','risus.In@sedsapienNunc.com','M','27-Oct-2009','673900','Franceville','Gabon','Africa','VISA','NONE');
INSERT INTO USER_DIM VALUES (456,'Halee','Donec@enimMaurisquis.edu','M','13-Oct-1978','50608','Port-Gentil','Gabon','Africa','MASTERCARD','BLACKBERRY');
INSERT INTO USER_DIM VALUES (457,'Jenette','posuere.enim.nisl@adipiscinglacusUt.com','F','26-Mar-1980','T3P 1B6','Kango','Gabon','Africa','AMERICAN EXPRESS','ARCHOS');
INSERT INTO USER_DIM VALUES (458,'Gary','posuere.vulputate.lacus@dignissimpharetra.ca','F','16-Jan-1971','579967','Franceville','Gabon','Africa','NONE','ONEPLUS');
INSERT INTO USER_DIM VALUES (459,'Forrest','tristique@mipede.ca','M','01-Jul-2007','70811','Libreville','Gabon','Africa','AMERICAN EXPRESS','XIAOMI');
INSERT INTO USER_DIM VALUES (460,'Len','Phasellus.elit@pellentesquetellussem.net','F','01-Apr-1964','717115','Oyem','Gabon','Africa','GIFT CARD','SAMSUNG');
INSERT INTO USER_DIM VALUES (461,'Gregory','pede.Nunc.sed@ipsumSuspendisse.com','M','15-Jan-1974','2194 OZ','Kango','Gabon','Africa','GIFT CARD','HTC');
INSERT INTO USER_DIM VALUES (462,'Ima','pede.ultrices@Duissitamet.com','F','18-May-1974','349479','Libreville','Gabon','Africa','NONE','SAMSUNG');
INSERT INTO USER_DIM VALUES (463,'Triton','enim.sit@ullamcorpereueuismod.edu','F','23-Sep-1974','448573','Franceville','Gabon','Africa','MASTERCARD','ZTE');
INSERT INTO USER_DIM VALUES (464,'Walter','ultricies@ipsum.co.uk','F','21-Oct-2004','6952','Oyem','Gabon','Africa','GIFT CARD','NONE');
INSERT INTO USER_DIM VALUES (465,'Sierra','tempor.arcu.Vestibulum@tortordictumeu.ca','M','17-Apr-1993','0722 PV','Moanda','Gabon','Africa','NONE','HTC');
INSERT INTO USER_DIM VALUES (466,'Paprika','blandit@bibendum.net','F','25-Nov-1996','569888','Libreville','Gabon','Africa','AMERICAN EXPRESS','BLACKBERRY');
INSERT INTO USER_DIM VALUES (467,'Xavier','Fusce.mi@Nuncac.co.uk','F','16-Sep-1990','268121','Oyem','Gabon','Africa','VISA','MOTOROLA');
INSERT INTO USER_DIM VALUES (468,'Charles','erat.Etiam.vestibulum@erosturpisnon.com','F','22-Oct-1986','7249','Kango','Gabon','Africa','GIFT CARD','HTC');
INSERT INTO USER_DIM VALUES (469,'Tyler','neque.non@et.com','F','21-Mar-1969','7885','Libreville','Gabon','Africa','AMERICAN EXPRESS','ONEPLUS');
INSERT INTO USER_DIM VALUES (470,'Vladimir','leo.Vivamus@acarcu.edu','F','30-Jun-1988','983108','Libreville','Gabon','Africa','NONE','BLACKBERRY');
INSERT INTO USER_DIM VALUES (471,'Jojo','ut.ipsum@Duiselementum.edu','M','09-Jun-2009','11861','Kango','Gabon','Africa','GIFT CARD','XIAOMI');
INSERT INTO USER_DIM VALUES (472,'Peter','lectus.pede.et@etnetus.com','M','22-Dec-2002','6130','Franceville','Gabon','Africa','GIFT CARD','NONE');
INSERT INTO USER_DIM VALUES (473,'Avril','Maecenas@vestibulumnequesed.net','F','22-Sep-1990','K7X 1K2','Port-Gentil','Gabon','Africa','AMERICAN EXPRESS','BQ');
INSERT INTO USER_DIM VALUES (474,'Abbot','arcu.Sed.et@doloregestas.co.uk','M','18-Mar-1972','944418','Oyem','Gabon','Africa','AMERICAN EXPRESS','ZTE');
INSERT INTO USER_DIM VALUES (475,'Jackson','elit.pellentesque.a@enimconsequatpurus.edu','F','31-May-1976','407484','Port-Gentil','Gabon','Africa','GIFT CARD','MOTOROLA');
INSERT INTO USER_DIM VALUES (476,'Xyla','ut.lacus@vitaemaurissit.com','M','10-Jan-1980','62166','Moanda','Gabon','Africa','AMERICAN EXPRESS','SAMSUNG');
INSERT INTO USER_DIM VALUES (477,'Alvin','quam.a@variusultricesmauris.com','F','02-Apr-1989','73340','Moanda','Gabon','Africa','GIFT CARD','ARCHOS');
INSERT INTO USER_DIM VALUES (478,'Montana','quis.tristique.ac@nuncinterdum.net','F','10-Sep-1984','267682','Accra','Ghana','Africa','NONE','IPHONE');
INSERT INTO USER_DIM VALUES (479,'Melinda','auctor@semegetmassa.edu','M','11-Oct-2001','240662','Sekondi','Ghana','Africa','AMERICAN EXPRESS','LG');
INSERT INTO USER_DIM VALUES (480,'Benitez','ut@loremutaliquam.net','F','03-Nov-2003','80663-003','Tema','Ghana','Africa','AMERICAN EXPRESS','XIAOMI');
INSERT INTO USER_DIM VALUES (481,'Aurora','Curabitur.sed@dictumeueleifend.co.uk','F','06-May-1976','7242 QU','Tamale','Ghana','Africa','NONE','HUAWEI');
INSERT INTO USER_DIM VALUES (482,'Thaddeus','nisi@Sedet.co.uk','M','25-Sep-1997','23001','Cape Coast','Ghana','Africa','VISA','ZTE');
INSERT INTO USER_DIM VALUES (483,'Ulric','sagittis.augue.eu@nequeMorbi.org','M','18-Jan-1982','51668','Tema','Ghana','Africa','NONE','MOTOROLA');
INSERT INTO USER_DIM VALUES (484,'Darius','at.egestas@et.net','M','26-Jan-1972','82-566','Sekondi','Ghana','Africa','VISA','LG');
INSERT INTO USER_DIM VALUES (485,'Venus','sit.amet@blandit.ca','F','12-Oct-1986','832917','Cape Coast','Ghana','Africa','GIFT CARD','ARCHOS');
INSERT INTO USER_DIM VALUES (486,'Kessie','libero.Integer@orci.edu','F','29-Apr-2006','10511','Kumasi','Ghana','Africa','GIFT CARD','ARCHOS');
INSERT INTO USER_DIM VALUES (487,'Patrick','tincidunt.Donec.vitae@perinceptoshymenaeos.org','M','07-Nov-1964','1244','Sekondi','Ghana','Africa','NONE','HTC');
INSERT INTO USER_DIM VALUES (488,'Giselle','ipsum.dolor.sit@Proinultrices.co.uk','F','23-Jan-1979','75560','Cape Coast','Ghana','Africa','VISA','MOTOROLA');
INSERT INTO USER_DIM VALUES (489,'MacKenzie','id.erat.Etiam@liberoMorbiaccumsan.org','F','21-Apr-1990','56908-662','Tema','Ghana','Africa','VISA','NONE');
INSERT INTO USER_DIM VALUES (490,'Buckminster','natoque.penatibus@Fuscemilorem.com','M','08-Jun-1969','495951','Accra','Ghana','Africa','AMERICAN EXPRESS','NONE');
INSERT INTO USER_DIM VALUES (491,'Keegan','mauris.Integer@vulputate.org','M','15-Nov-1973','03184','Sekondi','Ghana','Africa','VISA','MOTOROLA');
INSERT INTO USER_DIM VALUES (492,'Kerry','eget.laoreet.posuere@interdum.com','M','01-Jun-2003','70799','Tema','Ghana','Africa','NONE','ZTE');
INSERT INTO USER_DIM VALUES (493,'Tatiana','vestibulum@urnaVivamus.co.uk','M','03-Sep-1979','84461','Tamale','Ghana','Africa','NONE','ARCHOS');
INSERT INTO USER_DIM VALUES (494,'Coby','nisi.nibh@Crassed.org','M','29-May-1984','N3L 0V0','Sekondi','Ghana','Africa','MASTERCARD','LG');
INSERT INTO USER_DIM VALUES (495,'Channing','aliquam.eu@rhoncus.ca','F','08-Feb-1976','08691','Tamale','Ghana','Africa','NONE','NONE');
INSERT INTO USER_DIM VALUES (496,'Davil','tempus.mauris.erat@utdolordapibus.edu','F','07-Mar-2006','7036 DY','Cape Coast','Ghana','Africa','MASTERCARD','ZTE');
INSERT INTO USER_DIM VALUES (497,'Macey','sit@interdum.net','M','26-Sep-1993','253310','Tamale','Ghana','Africa','VISA','NONE');
INSERT INTO USER_DIM VALUES (498,'Colby','dapibus@pede.co.uk','M','03-Dec-2001','607220','Tamale','Ghana','Africa','GIFT CARD','HUAWEI');
INSERT INTO USER_DIM VALUES (499,'Baker','ridiculus@diamDuis.edu','M','24-Sep-1970','M09 3PI','Tamale','Ghana','Africa','MASTERCARD','BQ');
INSERT INTO USER_DIM VALUES (500,'Evangeline','Etiam.vestibulum.massa@mattisvelit.com','F','30-Nov-1992','7174','Kumasi','Ghana','Africa','GIFT CARD','BLACKBERRY');
INSERT INTO USER_DIM VALUES (501,'Marvin','posuere.cubilia.Curae@anteVivamusnon.edu','F','10-Oct-1986','522999','Accra','Ghana','Africa','NONE','MOTOROLA');
INSERT INTO USER_DIM VALUES (502,'Chandler','sed@gravidamolestiearcu.ca','F','24-Jan-1978','5265','Cape Coast','Ghana','Africa','AMERICAN EXPRESS','SAMSUNG');
INSERT INTO USER_DIM VALUES (503,'Marduk','quis.arcu.vel@justoeuarcu.net','M','25-Dec-1964','8723','Tema','Ghana','Africa','NONE','BQ');
INSERT INTO USER_DIM VALUES (504,'Veda','non.hendrerit@risus.com','M','09-Aug-2002','27664','Sekondi','Ghana','Africa','VISA','LG');
INSERT INTO USER_DIM VALUES (505,'Gage','elit@pedesagittisaugue.org','M','25-Sep-1976','9472','Kumasi','Ghana','Africa','MASTERCARD','BQ');
INSERT INTO USER_DIM VALUES (506,'Graiden','risus.quis.diam@orci.com','M','26-Jul-1977','686719','Sekondi','Ghana','Africa','VISA','HUAWEI');
INSERT INTO USER_DIM VALUES (507,'Shelly','rutrum.justo.Praesent@cursus.org','M','18-Oct-2001','7965','Johannesburg','South-Africa','Africa','AMERICAN EXPRESS','MOTOROLA');
INSERT INTO USER_DIM VALUES (508,'Martin','ac.mattis@velit.net','F','27-Feb-1970','1654','Durban','South-Africa','Africa','GIFT CARD','ZTE');
INSERT INTO USER_DIM VALUES (509,'Vera','risus@turpis.net','M','03-Aug-1989','OB6F 8YY','Pretoria','South-Africa','Africa','VISA','IPHONE');
INSERT INTO USER_DIM VALUES (510,'Ross','Proin.dolor@pharetraNam.co.uk','F','20-Mar-1979','99720','Johannesburg','South-Africa','Africa','GIFT CARD','BLACKBERRY');
INSERT INTO USER_DIM VALUES (511,'Uriah','tortor.nibh.sit@diamDuismi.org','M','21-Sep-2007','8391','Johannesburg','South-Africa','Africa','NONE','IPHONE');
INSERT INTO USER_DIM VALUES (512,'Brock','et.ultrices.posuere@et.edu','M','03-Mar-2006','95998','Soweto','South-Africa','Africa','NONE','SAMSUNG');
INSERT INTO USER_DIM VALUES (513,'Jugo','gravida.non@Donecnibhenim.co.uk','F','09-Jan-1980','65868','Durban','South-Africa','Africa','MASTERCARD','LG');
INSERT INTO USER_DIM VALUES (514,'Honorato','eget.tincidunt.dui@semperpretium.net','F','08-Sep-2000','5365','Durban','South-Africa','Africa','NONE','ONEPLUS');
INSERT INTO USER_DIM VALUES (515,'Britanni','Curabitur@Maecenasornareegestas.co.uk','F','21-Oct-1998','51817','East London','South-Africa','Africa','VISA','ZTE');
INSERT INTO USER_DIM VALUES (516,'Dylan','Nunc.mauris.elit@necleoMorbi.co.uk','F','21-Dec-2002','1756','Durban','South-Africa','Africa','NONE','ONEPLUS');
INSERT INTO USER_DIM VALUES (517,'Faya','arcu.Vestibulum.ut@nunc.net','F','04-Mar-1992','4993','Cape Town','South-Africa','Africa','NONE','NONE');
INSERT INTO USER_DIM VALUES (518,'Corton','nec.ante@vitaedolorDonec.net','M','09-Nov-1997','69972','East London','South-Africa','Africa','VISA','IPHONE');
INSERT INTO USER_DIM VALUES (519,'Germaine','convallis.ligula@tinciduntcongueturpis.co.uk','M','30-Oct-1992','5749','Soweto','South-Africa','Africa','NONE','MEIZU');
INSERT INTO USER_DIM VALUES (520,'Kyra','a@Nunclaoreetlectus.co.uk','M','02-Sep-1990','TM0S 8ZH','Pretoria','South-Africa','Africa','AMERICAN EXPRESS','BLACKBERRY');
INSERT INTO USER_DIM VALUES (521,'Alexia','ligula.Nullam.feugiat@vitae.edu','M','09-Apr-2009','313706','Durban','South-Africa','Africa','AMERICAN EXPRESS','ARCHOS');
INSERT INTO USER_DIM VALUES (522,'Duncan','nec.tellus@orciDonecnibh.ca','M','10-Sep-1968','14607','East London','South-Africa','Africa','MASTERCARD','SAMSUNG');
INSERT INTO USER_DIM VALUES (523,'Hillary','dolor.tempus.non@aliquet.ca','M','13-Feb-1983','701381','Johannesburg','South-Africa','Africa','MASTERCARD','MEIZU');
INSERT INTO USER_DIM VALUES (524,'Julie','metus.In@Aliquamtinciduntnunc.com','M','15-Nov-1972','95-806','East London','South-Africa','Africa','NONE','LG');
INSERT INTO USER_DIM VALUES (525,'Armand','nec.mauris.blandit@rhoncus.org','M','21-Sep-1984','28987','Johannesburg','South-Africa','Africa','NONE','MOTOROLA');
INSERT INTO USER_DIM VALUES (526,'Zachary','sodales.nisi.magna@ametconsectetueradipiscing.org','F','02-May-2009','1994','Durban','South-Africa','Africa','VISA','XIAOMI');
INSERT INTO USER_DIM VALUES (527,'Aidan','elementum.sem@ligula.co.uk','F','29-Sep-1995','40039','Pretoria','South-Africa','Africa','VISA','BQ');
INSERT INTO USER_DIM VALUES (528,'Veda','quam@euplacerat.org','F','14-Dec-2004','18-052','Mombasa','Kenya','Africa','GIFT CARD','XIAOMI');
INSERT INTO USER_DIM VALUES (529,'Shana','dolor.Quisque@rutrummagna.ca','M','28-Sep-1996','30832','Eldoret','Kenya','Africa','MASTERCARD','NONE');
INSERT INTO USER_DIM VALUES (530,'Lenore','tellus@sapien.ca','F','21-Jun-1965','556028','Malindi','Kenya','Africa','NONE','XIAOMI');
INSERT INTO USER_DIM VALUES (531,'Jemima','Vivamus@Mauris.co.uk','M','26-May-1975','406873','Malindi','Kenya','Africa','GIFT CARD','MEIZU');
INSERT INTO USER_DIM VALUES (532,'Hakeem','lacinia.Sed@aliquamenim.co.uk','M','26-Apr-1985','67944','Kisumu','Kenya','Africa','NONE','MEIZU');
INSERT INTO USER_DIM VALUES (533,'Tanya','sagittis.Nullam@ipsum.com','F','22-Oct-2008','807503','Nairobi','Kenya','Africa','AMERICAN EXPRESS','SAMSUNG');
INSERT INTO USER_DIM VALUES (534,'Dudley','auctor.odio.a@egetvariusultrices.ca','F','09-Mar-1992','66834','Kisumu','Kenya','Africa','AMERICAN EXPRESS','ONEPLUS');
INSERT INTO USER_DIM VALUES (535,'Kerry','vel.est@idante.co.uk','F','18-Jul-1978','N5Z 4C7','Mombasa','Kenya','Africa','VISA','XIAOMI');
INSERT INTO USER_DIM VALUES (536,'Zena','nec@egestas.net','M','28-Jun-2009','63240','Malindi','Kenya','Africa','GIFT CARD','NONE');
INSERT INTO USER_DIM VALUES (537,'Hu','nec.ligula@risus.edu','M','16-Apr-1985','6447','Nakuru','Kenya','Africa','MASTERCARD','LG');
INSERT INTO USER_DIM VALUES (538,'Randall','pede.Praesent.eu@Aenean.ca','M','28-Sep-1969','7674','Nairobi','Kenya','Africa','MASTERCARD','ONEPLUS');
INSERT INTO USER_DIM VALUES (539,'Koten','Phasellus.nulla.Integer@neque.com','M','24-Oct-1973','5150','Nakuru','Kenya','Africa','MASTERCARD','ARCHOS');
INSERT INTO USER_DIM VALUES (540,'Simon','nonummy.ultricies@Aliquam.edu','F','23-Apr-1975','249162','Malindi','Kenya','Africa','VISA','BQ');
INSERT INTO USER_DIM VALUES (541,'Lillith','Aliquam.adipiscing.lobortis@pretiumneque.com','F','18-May-1990','43089-351','Nairobi','Kenya','Africa','MASTERCARD','XIAOMI');
INSERT INTO USER_DIM VALUES (542,'Ryan','ornare@semperegestasurna.co.uk','F','08-Apr-1966','65409','Malindi','Kenya','Africa','GIFT CARD','XIAOMI');
INSERT INTO USER_DIM VALUES (543,'Joker','egestas.nunc.sed@montesnasceturridiculus.edu','M','02-Oct-1982','Z0 2XX','Nairobi','Kenya','Africa','NONE','ONEPLUS');
INSERT INTO USER_DIM VALUES (544,'Tucker','rutrum.justo@arcu.net','M','22-Aug-2001','U4P 5SR','Eldoret','Kenya','Africa','NONE','MEIZU');
INSERT INTO USER_DIM VALUES (545,'Alexander','Quisque@atpedeCras.net','M','13-Sep-1964','T4 3KI','Malindi','Kenya','Africa','MASTERCARD','HTC');
INSERT INTO USER_DIM VALUES (546,'Cheryl','Nullam.scelerisque@eutellus.co.uk','M','04-Dec-2002','844486','Eldoret','Kenya','Africa','NONE','MOTOROLA');
INSERT INTO USER_DIM VALUES (547,'Denton','mollis.dui.in@urna.org','F','24-Jul-1979','89199','Malindi','Kenya','Africa','GIFT CARD','NONE');
INSERT INTO USER_DIM VALUES (548,'Ruby','Sed@cursuset.com','F','03-Sep-1991','614424','Kisumu','Kenya','Africa','NONE','XIAOMI');
INSERT INTO USER_DIM VALUES (549,'Wesley','erat@convallisconvallis.edu','F','15-Mar-1991','318024','Nakuru','Kenya','Africa','GIFT CARD','XIAOMI');
INSERT INTO USER_DIM VALUES (550,'Ezekiel','arcu.vel@interdum.org','M','16-May-1996','56754','Lubumbashi','RDC Congo','Africa','NONE','HUAWEI');
INSERT INTO USER_DIM VALUES (551,'Maris','commodo.auctor.velit@eliteratvitae.com','M','14-Mar-1996','S9R 2S8','Bukavu','RDC Congo','Africa','NONE','NONE');
INSERT INTO USER_DIM VALUES (552,'Honda','nec.mollis@Mauris.ca','M','24-Apr-2006','10409','Matadi','RDC Congo','Africa','GIFT CARD','ZTE');
INSERT INTO USER_DIM VALUES (553,'Lillith','sapien@lobortistellus.net','F','22-Aug-1982','HH1 0VG','Kisangani','RDC Congo','Africa','AMERICAN EXPRESS','MEIZU');
INSERT INTO USER_DIM VALUES (554,'Baldur','ultricies@Proineget.net','F','23-Dec-1978','20508','Kinshasa','RDC Congo','Africa','GIFT CARD','HTC');
INSERT INTO USER_DIM VALUES (555,'Maite','conubia@Donecporttitor.ca','M','29-Apr-1990','30803','Matadi','RDC Congo','Africa','MASTERCARD','HUAWEI');
INSERT INTO USER_DIM VALUES (556,'Shaine','purus@aliquameros.edu','F','22-Aug-1965','7324','Lubumbashi','RDC Congo','Africa','GIFT CARD','MEIZU');
INSERT INTO USER_DIM VALUES (557,'Fatima','semper@aliquetProinvelit.co.uk','F','25-Nov-2009','0297 AB','Lubumbashi','RDC Congo','Africa','GIFT CARD','MOTOROLA');
INSERT INTO USER_DIM VALUES (558,'Carson','nascetur.ridiculus@gravidaPraesent.ca','M','20-Jan-2002','4011','Kinshasa','RDC Congo','Africa','GIFT CARD','SAMSUNG');
INSERT INTO USER_DIM VALUES (559,'Allistar','volutpat.nunc.sit@aliquetmolestie.ca','M','23-May-1992','75503','Kinshasa','RDC Congo','Africa','NONE','ZTE');
INSERT INTO USER_DIM VALUES (560,'Victoria','egestas.Aliquam@nonlaciniaat.net','F','08-Jan-1969','15864','Lubumbashi','RDC Congo','Africa','AMERICAN EXPRESS','HUAWEI');
INSERT INTO USER_DIM VALUES (561,'Suki','dolor.Quisque.tincidunt@aliquamarcu.co.uk','M','07-Oct-1980','6723','Lubumbashi','RDC Congo','Africa','MASTERCARD','ARCHOS');
INSERT INTO USER_DIM VALUES (562,'Ciara','dictum@egestasAliquam.edu','M','28-Dec-1999','30083','Kisangani','RDC Congo','Africa','NONE','HTC');
INSERT INTO USER_DIM VALUES (563,'Marsden','eu.ultrices@arcu.org','M','29-Jul-1979','56618-624','Goma','RDC Congo','Africa','GIFT CARD','ONEPLUS');
INSERT INTO USER_DIM VALUES (564,'Steel','erat@ipsumSuspendisse.ca','F','29-Jan-1971','45457','Bukavu','RDC Congo','Africa','MASTERCARD','ARCHOS');
INSERT INTO USER_DIM VALUES (565,'Jared','justo@vulputatemaurissagittis.co.uk','F','05-Mar-1996','9992','Goma','RDC Congo','Africa','NONE','BLACKBERRY');
INSERT INTO USER_DIM VALUES (566,'Claire','cubilia@Integerinmagna.com','F','04-Apr-1992','1878','Kisangani','RDC Congo','Africa','MASTERCARD','ZTE');
INSERT INTO USER_DIM VALUES (567,'Pluto','diam.Sed@mi.org','M','24-Apr-1978','74-186','Bukavu','RDC Congo','Africa','NONE','HTC');
INSERT INTO USER_DIM VALUES (568,'Daquan','arcu.Sed@consequatauctornunc.com','F','12-Sep-1968','35624','Lubumbashi','RDC Congo','Africa','VISA','BQ');

------------------------------------------------------------------ REMPLISSAGE PLATFORM_DIM -------------------------------------------------------------------------------------

INSERT INTO PLATFORM_DIM VALUES (1,'Iphone 6','SMARTPHONE','158.1','77.8','iOS','1.4 GHz dual-core',NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (2,'Iphone 7','SMARTPHONE','158.2','77.9','iOS','2.34 GHz quad-core',NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (3,'Iphone 8','SMARTPHONE','158.4','78.1','iOS','2.39 GHz hexa-core',NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (4,'Iphone X','SMARTPHONE','143.6','70.9','iOS','2.39 GHz hexa-core',NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (5,'Iphone Xs','SMARTPHONE','123.8','58.6','iOS','2.49 GHz hexa-core',NULL,NULL);

INSERT INTO PLATFORM_DIM VALUES (6,'Samsung S7','SMARTPHONE','142.4','69.6','Android','Samsung Exynos 8890 ',NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (7,'Samsung S8','SMARTPHONE','148.9','68.1','Android','Exynos 8895 Octa',NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (8,'Samsung S9','SMARTPHONE','147.7','68.8','Android','2.49 GHz hexa-core',NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (9,'Samsung A5 2017','SMARTPHONE','146.1','71.4','Android','Exynos 7880 Octa',NULL,NULL);

INSERT INTO PLATFORM_DIM VALUES (10,'Sony Xperia XZ3','SMARTPHONE','158','73','Android',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (11,'Sony Xperia X','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (12,'Sony Xperia XZ','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (13,'Sony Xperia E5','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);

INSERT INTO PLATFORM_DIM VALUES (14,'Alcatel 5v','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (15,'Alcatel 3x','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (16,'Alcatel Pulsemix','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);

INSERT INTO PLATFORM_DIM VALUES (17,'Asus Zenfone V','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (18,'Asus Zenfone Go','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (19,'Asus ZenPad','TABLET',NULL,NULL,'Android',NULL,NULL,NULL);

INSERT INTO PLATFORM_DIM VALUES (20,'Archos Access 70','TABLET',NULL,NULL,'Android',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (21,'Archos Core 101','TABLET',NULL,NULL,'Android',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (22,'Archos 70 Oxygen','TABLET',NULL,NULL,'Android',NULL,NULL,NULL);

INSERT INTO PLATFORM_DIM VALUES (23,'BlackBerry Evolve X','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (24,'BlackBerry Keyone','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (25,'BlackBerry Aurora','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);

INSERT INTO PLATFORM_DIM VALUES (26,'BQ Aquaris X2','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (27,'BQ Aquaris U','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (28,'BQ Aquaris M10','TABLET',NULL,NULL,'Android',NULL,NULL,NULL);

INSERT INTO PLATFORM_DIM VALUES (29,'HTC U Ultra','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (30,'HTC U12 life','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (31,'HTC Exodus 1','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);

INSERT INTO PLATFORM_DIM VALUES (32,'Huawei Honor 10','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (33,'Huawei Mate 20','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (34,'Huawei MediaPad M5 10','TABLET',NULL,NULL,'Android',NULL,NULL,NULL);

INSERT INTO PLATFORM_DIM VALUES (35,'LG X5','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (36,'LG V20','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (37,'LG Q8','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);

INSERT INTO PLATFORM_DIM VALUES (38,'Meizu Note 8','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (39,'Meizu V8 Pro','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (40,'Meizu M8C','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);

INSERT INTO PLATFORM_DIM VALUES (41,'Motorola Moto E5','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (42,'Motorola Moto X Style','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (43,'Motorola Droid Turbo 2','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);

INSERT INTO PLATFORM_DIM VALUES (44,'Nokia 7.1','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (45,'Nokia 8 Sirocco','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (46,'Nokia Lumia 2520','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);

INSERT INTO PLATFORM_DIM VALUES (47,'OnePLus 6T','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (48,'OnePLus 5','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (49,'OnePLus X','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);

INSERT INTO PLATFORM_DIM VALUES (50,'Xiaomi Mi 8 Pro','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (51,'Xiaomi Max 3','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (52,'Xiaomi Mi Pad 4 Plus','TABLET',NULL,NULL,'Android',NULL,NULL,NULL);

INSERT INTO PLATFORM_DIM VALUES (53,'ZTE nubia V18','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (54,'ZTE Blade A6','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (55,'ZTE Axon 7s','SMARTPHONE',NULL,NULL,'Android',NULL,NULL,NULL);

INSERT INTO PLATFORM_DIM VALUES (56,'Xbox One X','CONSOLE',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (57,'Playstation 4 Pro','CONSOLE',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (58,'Playstation 3','CONSOLE',NULL,NULL,NULL,NULL,NULL,NULL);

INSERT INTO PLATFORM_DIM VALUES (59,'Audi A6','VEHICLE',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (60,'Bugatti Veyron','VEHICLE',NULL,NULL,NULL,NULL,NULL,NULL);

INSERT INTO PLATFORM_DIM VALUES (61,'Mac','PC',NULL,NULL,'macOS',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (62,'Windows','PC',NULL,NULL,'Microsoft Windows',NULL,NULL,NULL);
INSERT INTO PLATFORM_DIM VALUES (63,'Linux','PC',NULL,NULL,'GNU/Linux',NULL,NULL,NULL);

------------------------------------------------------------- REMPLISSAGE SUBSCRIPTION_TYPE_DIM ------------------------------------------------------------------------------------

INSERT INTO SUBSCRIPTION_TYPE_DIM VALUES (1,'FREE','Free Subscription','Everyone',1,0.00,1,'160 KBPS','NO');
INSERT INTO SUBSCRIPTION_TYPE_DIM VALUES (2,'PREMIUM','Premium Subscription','Everyone',1,9.99,1,'320 KBPS','YES');
INSERT INTO SUBSCRIPTION_TYPE_DIM VALUES (3,'FAMILY PREMIUM','Premium Subscription for 4 People','Families',4,14.99,1,'320 KBPS','YES');
INSERT INTO SUBSCRIPTION_TYPE_DIM VALUES (4,'STUDENT PREMIUM','Premium Subscription for Students (50% Off)','Students',1,4.99,1,'320 KBPS','YES');

----------------------------------------------------------------- REMPLISSAGE PROMOTION_DIM ----------------------------------------------------------------------------------------

INSERT INTO PROMOTION_DIM VALUES (1,'Premium a 0.99€ durant 3 Mois',27,'PC, Phone, Tablet','Mail, Web Site, Application','03-Mar-2018','10-Mar-2018',NULL);
INSERT INTO PROMOTION_DIM VALUES (2,'3 Mois Premium a 9.99€',19.98,'PC, Phone, Tablet','Mail, Web Site, Application','07-Jun-2018','01-Jul-2018',NULL);
INSERT INTO PROMOTION_DIM VALUES (3,'2 Mois Premium Gratuit',19.98,'PC, Phone, Tablet','Mail, Web Sit, Applicatione','15-Sep-2018','20-Sep-2018',NULL);

------------------------------------------------------------------ REMPLISSAGE ARTIST_DIM ------------------------------------------------------------------------------------------

INSERT INTO ARTIST_DIM VALUES (1,'Maitre Gims','09-Jun-1980','French Variety','Congolese',2241536,542316,'French',NULL,'03-Mar-2013');
INSERT INTO ARTIST_DIM VALUES (2,'Booba','09-Jun-1980','Rap','Senegalese',2321650,345978,'French',NULL,'15-Jun-2013');
INSERT INTO ARTIST_DIM VALUES (3,'Francis Cabrel','09-Jun-1980','French Variety','French',895623,83000,'French',NULL,'03-Mar-2013');
INSERT INTO ARTIST_DIM VALUES (4,'Dinah Washington','09-Jun-1980','Soul','American',1023363,542316,'English',NULL,'03-Mar-2013');
INSERT INTO ARTIST_DIM VALUES (5,'Nina Simone','09-Jun-1980','Soul','American',803654,201679,'English',NULL,'03-Mar-2013');
INSERT INTO ARTIST_DIM VALUES (6,'John Coltrane','09-Jun-1980','Jazz','American',1563247,720146,'English',NULL,'03-Mar-2013');
INSERT INTO ARTIST_DIM VALUES (7,'Aya Nakamura','09-Jun-1980','French Variety','Congolese',7365478,3012564,'French',NULL,'03-Mar-2013');
INSERT INTO ARTIST_DIM VALUES (8,'Damso','09-Jun-1980','Rap','Congolese',4321564,1365987,'French',NULL,'03-Mar-2013');
INSERT INTO ARTIST_DIM VALUES (9,'Rihanna','09-Jun-1980','R and B','Barbadian',30126458,7632145,'English',NULL,'03-Mar-2013');
INSERT INTO ARTIST_DIM VALUES (10,'Kendrick Lamar','09-Jun-1980','Rap','American',29651324,6532148,'English',NULL,'03-Mar-2013');
INSERT INTO ARTIST_DIM VALUES (11,'Michael Jackson','09-Jun-1960','Pop','American',2241536,542316,'English',NULL,'03-Mar-2013');


------------------------------------------------------------------ REMPLISSAGE MUSIC_DIM ------------------------------------------------------------------------------------------

INSERT INTO MUSIC_DIM VALUES (1, 'Bella', 'Pop', '01-Jun-2013', 186, 'NO', 165, 'NO');
INSERT INTO MUSIC_DIM VALUES (2, 'Oulala', 'Pop', '23-Mar-2018', 192, 'NO', 153, 'NO');
INSERT INTO MUSIC_DIM VALUES (3, 'Only girl', 'Pop', '20-Feb-2010', 180, 'NO', 142, 'NO');
INSERT INTO MUSIC_DIM VALUES (4, 'Aux paradis', 'Rap', '20-May-2018', 203, 'NO', 145, 'NO');
INSERT INTO MUSIC_DIM VALUES (5, 'Djadja', 'Rap', '6-Apr-2018', 182, 'NO', 172, 'NO');
INSERT INTO MUSIC_DIM VALUES (6,'Mad ABout The Boy','Soul','05-May-1968',145,'NO',96,'NO');
INSERT INTO MUSIC_DIM VALUES (7,'What A Difference A Day Makes','Soul','12-Feb-1980',156,'NO',96,'NO');
INSERT INTO MUSIC_DIM VALUES (8,'Four Women','Soul','23-Jun-1980',145,'NO',96,'NO');
INSERT INTO MUSIC_DIM VALUES (9,'Marriage Is For Old Folks','Soul','04-May-1968',145,'NO',96,'NO');
INSERT INTO MUSIC_DIM VALUES (10,'Samedi Soir Sur La Terre','Pop','05-May-1995',145,'NO',110,'NO');
INSERT INTO MUSIC_DIM VALUES (11,'Petite Marie','Pop','05-Jul-1997',145,'NO',110,'NO');
INSERT INTO MUSIC_DIM VALUES (12,'HUMBLE.','Rap','05-Jun-2017',145,'NO',130,'NO');
INSERT INTO MUSIC_DIM VALUES (13,'Hoods Politic','Rap','05-May-2014',145,'NO',120,'NO');
INSERT INTO MUSIC_DIM VALUES (14,'Naima','Jazz','05-May-1968',145,'NO',96,'NO');
INSERT INTO MUSIC_DIM VALUES (15,'A Day In Wellington','Jazz','05-May-1968',145,'NO',96,'NO');
INSERT INTO MUSIC_DIM VALUES (16,'Sucette','Pop','05-May-2018',145,'NO',120,'NO');
INSERT INTO MUSIC_DIM VALUES (17,'Mosaique Solitaire','Rap','05-May-2017',145,'NO',125,'NO');
INSERT INTO MUSIC_DIM VALUES (18,'Rehab','R and B','30-May-2012',145,'NO',112,'NO');
INSERT INTO MUSIC_DIM VALUES (19,'Kalash','Rap','05-May-2013',145,'NO',135,'NO');
INSERT INTO MUSIC_DIM VALUES (20,'Boulbi','Rap','05-May-2004',145,'NO',96,'NO');
INSERT INTO MUSIC_DIM VALUES (21,'Thriller','Pop','05-May-1975',145,'NO',96,'NO');
INSERT INTO MUSIC_DIM VALUES (22,'Billie Jean','Pop', '22-Jun-1983',300,'NO',120,'YES');
INSERT INTO MUSIC_DIM VALUES (23,'Beat it','Pop', '22-Jul-1983',240,'NO',120,'NO');

------------------------------------------------------------------ REMPLISSAGE PLAYLIST_DIM ------------------------------------------------------------------------------------------

INSERT INTO PLAYLIST_DIM VALUES (1, 'La base', 'Spotify', 'Ben la base quoi', 2018, 5, 'De tout', 'NONE', 1221, 'NO', 'NO');
INSERT INTO PLAYLIST_DIM VALUES (2, 'Jazz Vibes', 'Spotify', 'Only Jazz Music', 2018, 200, 'Jazz', 'NONE', 40000, 'YES','NO');
INSERT INTO PLAYLIST_DIM VALUES (3, 'Fresh Rap', 'Spotify', 'Les nouveautés Rap, Hip-Hop', 2018, 30, 'Rap', 'NONE', 6000, 'YES','NO');
INSERT INTO PLAYLIST_DIM VALUES (4, 'Good Old Vibes', 'Spotify', 'Throwback To Last Centuries Songs', 2012, 500, 'Rap', 'NONE', 100000, 'YES','NO');
INSERT INTO PLAYLIST_DIM VALUES (5, 'Nakamura', 'Aya Nakamura', NULL, 2018, 12, 'Pop', 'NONE', 2280, 'YES','NO');


------------------------------------------------------------------ REMPLISSAGE SPOTIFY_SUBSCRIPTION ------------------------------------------------------------------------------------------

INSERT INTO SPOTIFY_SUBSCRIPTION VALUES (20180615,1, 1, 1, 1, 0, NULL, NULL, NULL);
INSERT INTO SPOTIFY_SUBSCRIPTION VALUES (20180215,2,1,3,6,0.00,NULL,NULL,NULL);
INSERT INTO SPOTIFY_SUBSCRIPTION VALUES (20180519,5, 3, 1, 1, 9.99, NULL, NULL, NULL);
INSERT INTO SPOTIFY_SUBSCRIPTION VALUES (20180314,6,3,1,4,9.99,'03-Apr-2018',NULL,NULL);
INSERT INTO SPOTIFY_SUBSCRIPTION VALUES (20180112,3,4,NULL,9,4.99,'22-Jun-2018','22-Jul-2018',NULL);
INSERT INTO SPOTIFY_SUBSCRIPTION VALUES (20180112,4,1,NULL,8,0,NULL,NULL,NULL);
INSERT INTO SPOTIFY_SUBSCRIPTION VALUES (20180112,7,2,NULL,51,9.99,'22-May-2018','22-May-2018',NULL);
INSERT INTO SPOTIFY_SUBSCRIPTION VALUES (20180112,8,2,NULL,15,9.99,'22-Apr-2018','22-May-2018',NULL);
INSERT INTO SPOTIFY_SUBSCRIPTION VALUES (20180112,9,3,NULL,52,9.99,'22-Jan-2018','22-Feb-2018',NULL);
INSERT INTO SPOTIFY_SUBSCRIPTION VALUES (20180112,10,2,NULL,44,0,NULL,NULL,NULL);
INSERT INTO SPOTIFY_SUBSCRIPTION VALUES (20180112,11,1,NULL,42,0,NULL,NULL,NULL);
INSERT INTO SPOTIFY_SUBSCRIPTION VALUES (20180112,12,3,NULL,45,0,NULL,NULL,NULL);
INSERT INTO SPOTIFY_SUBSCRIPTION VALUES (20180112,13,2,NULL,NULL,0,NULL,NULL,NULL);

------------------------------------------------------------------ REMPLISSAGE SPOTIFY_STREAM ------------------------------------------------------------------------------------------

INSERT INTO SPOTIFY_STREAM VALUES (20180915, 222324, 1, 21, 11, 1, 1, 'NO', 150, 0, 'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20181026, 124555, 1, 18, 9, 1, 1, 'NO', 110, 0, 'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180211, 164511, 1, 12, 10, 1, 1, 'NO', 120, 0, 'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180313, 084510, 1, 16, 7, 1, 1, 'NO', 145, 0, 'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180422, 094807, 1, 4, 8, 1, 1, 'NO', 145, 0, 'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180603, 174800, 1, 2, 1, 1, 1, 'NO', 180, 0, 'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180707, 202028, 1, 17, 8, 1, 1, 'NO', 140, 0, 'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180606, 112018, 5, 3, 9, 1, 5, 'NO', 170, 0, 'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180220, 132219, 5, 20, 2, 1, 5, 'NO', 140, 0, 'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180102, 142834, 5, 22, 11, 1, 1, 'NO', 140, 0, 'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180408, 041136, 5, 22, 11, 1, 1, 'NO', 140, 0, 'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180521,065421,2,22,11,1,3,'NO',21,0,'NO');
INSERT INTO SPOTIFY_STREAM VALUES (20180521,065900,2,22,11,1,3,'NO',210,0,'NO');
INSERT INTO SPOTIFY_STREAM VALUES (20180522,075321,2,23,11,1,2,'NO',60,0,'NO');
INSERT INTO SPOTIFY_STREAM VALUES (20180621,162421,2,17,8,1,1,'NO',67,0,'NO');
INSERT INTO SPOTIFY_STREAM VALUES (20181001,135411,2,17,8,1,2,'NO',211,34,'NO');
INSERT INTO SPOTIFY_STREAM VALUES (20180621,125454,2,22,11,1,3,'NO',300,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180811,131313,2,22,11,1,3,'NO',21,1,'NO');
INSERT INTO SPOTIFY_STREAM VALUES (20180410,065421,6,22,11,1,3,'NO',21,0,'NO');
INSERT INTO SPOTIFY_STREAM VALUES (20180527,142810,6,22,11,1,3,'NO',210,0,'NO');
INSERT INTO SPOTIFY_STREAM VALUES (20180528,235321,6,23,11,1,2,'NO',60,0,'NO');
INSERT INTO SPOTIFY_STREAM VALUES (20180601,162421,6,17,8,1,1,'NO',67,0,'NO');
INSERT INTO SPOTIFY_STREAM VALUES (20181001,135411,6,1,1,1,59,'YES',11,1,'NO');
INSERT INTO SPOTIFY_STREAM VALUES (20180621,125454,6,1,1,1,3,'NO',127,21,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180811,131313,6,22,11,1,3,'NO',21,3,'NO');
INSERT INTO SPOTIFY_STREAM VALUES (20180313,155402,3,6,4,2,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180313,161202,3,7,4,2,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180313,162302,3,14,6,2,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180313,165402,3,15,6,2,62,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180317,185402,3,16,7,5,63,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180317,195402,3,5,7,5,63,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180320,205402,3,12,10,3,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180323,215402,3,13,10,2,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180327,000001,3,18,9,1,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052013,3,21,11,4,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052013,3,4,8,1,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052013,3,17,8,1,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052013,3,20,2,1,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052013,3,21,11,4,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180403,215402,4,1,1,1,8,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180720,000001,4,2,1,1,8,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180530,052013,4,18,9,1,62,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180612,122013,4,11,3,1,62,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180830,132013,4,3,9,1,62,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180223,052013,4,5,7,1,8,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052013,4,12,10,3,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180314,155402,5,6,4,2,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180314,161202,5,7,4,2,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180314,162302,5,14,6,2,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180314,165402,5,15,6,2,62,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180317,185402,5,16,7,5,63,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180317,195402,5,5,7,5,63,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180320,205402,5,12,10,3,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180325,215402,5,13,10,2,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180327,000001,5,18,9,1,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052012,5,21,11,4,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052011,5,4,8,1,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052017,5,17,8,1,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052019,5,20,2,1,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052019,5,21,11,4,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180409,215402,12,1,1,1,8,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180720,000001,12,2,1,1,8,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180530,052014,12,18,9,1,62,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180612,122017,12,11,3,1,62,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180830,132016,12,3,9,1,62,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180124,052012,12,5,7,1,8,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20181030,052013,12,12,10,3,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180314,155402,6,6,4,2,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180314,161202,6,7,4,2,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180314,162302,6,14,6,2,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180314,165402,6,15,6,2,62,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180317,185402,6,16,7,5,63,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180317,195402,6,5,7,5,63,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180320,205402,6,12,10,3,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180325,215402,6,13,10,2,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180327,000001,6,18,9,1,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052012,6,21,11,4,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052011,6,4,8,1,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052017,6,17,8,1,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052019,6,20,2,1,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052019,6,21,11,4,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180314,155402,7,6,4,2,51,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180314,161202,7,7,4,2,51,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180314,162302,7,14,6,2,51,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180314,165402,7,15,6,2,51,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180317,185402,7,16,7,5,51,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180317,195402,7,5,7,5,51,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180320,205402,7,12,10,3,51,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180325,215402,7,13,10,2,51,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180327,000001,7,18,9,1,51,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052012,7,21,11,4,51,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052011,7,4,8,1,51,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052017,7,17,8,1,51,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052019,7,20,2,1,51,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052019,7,21,11,4,51,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180314,155402,8,6,4,2,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180314,161202,8,7,4,2,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180314,162302,8,14,6,2,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180314,165402,8,15,6,2,62,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180317,185402,8,16,7,5,63,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180317,195402,8,5,7,5,63,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180320,205402,8,12,10,3,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180325,215402,8,13,10,2,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180327,000001,8,18,9,1,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052012,8,21,11,4,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052011,8,4,8,1,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052017,8,17,8,1,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052019,8,20,2,1,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052019,8,21,11,4,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180314,155402,9,6,4,2,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180314,161202,9,7,4,2,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180314,162302,9,14,6,2,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180314,165402,9,15,6,2,62,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180317,185402,9,16,7,5,63,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180317,195402,9,5,7,5,63,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180320,205402,9,12,10,3,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180325,215402,9,13,10,2,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180327,000001,9,18,9,1,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052012,9,21,11,4,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052011,9,4,8,1,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052017,9,17,8,1,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052019,9,20,2,1,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052019,9,21,11,4,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180314,155402,10,6,4,2,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180314,161202,10,7,4,2,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180314,162302,10,14,6,2,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180314,165402,10,15,6,2,62,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180317,185402,10,16,7,5,63,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180317,195402,10,5,7,5,63,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180320,205402,10,12,10,3,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180325,215402,10,13,10,2,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180327,000001,10,18,9,1,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052012,10,21,11,4,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052011,10,4,8,1,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052017,10,17,8,1,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052019,10,20,2,1,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052019,10,21,11,4,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180314,155402,11,6,4,2,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180314,161202,11,7,4,2,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180314,162302,11,14,6,2,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180314,165402,11,15,6,2,62,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180317,185402,11,16,7,5,63,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180317,195402,11,5,7,5,63,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180320,205402,11,12,10,3,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180325,215402,11,13,10,2,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180327,000001,11,18,9,1,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052012,11,21,11,4,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052011,11,4,8,1,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052017,11,17,8,1,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052019,11,20,2,1,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180330,052019,11,21,11,4,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180409,215402,13,1,1,1,8,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180720,000001,13,2,1,1,8,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180530,052014,13,18,9,1,62,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180612,122017,13,11,3,1,62,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180830,132016,13,3,9,1,62,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180824,052012,13,5,7,1,8,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180930,052013,13,12,10,3,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180409,215402,14,1,1,1,8,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180720,000001,14,2,1,1,8,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180530,052014,14,18,9,1,62,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180612,122017,14,11,3,1,62,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180830,132016,14,3,9,1,62,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20181024,052012,14,5,7,1,8,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20181030,052013,14,12,10,3,9,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180409,215402,7,1,1,1,51,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180720,000001,7,2,1,1,51,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180530,052014,7,18,9,1,51,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180612,122017,7,11,3,1,51,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180830,132016,7,3,9,1,51,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180524,052012,7,5,7,1,51,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180530,052013,7,12,10,3,51,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180409,215402,10,1,1,1,8,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180720,000001,10,2,1,1,8,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180530,052014,10,18,9,1,62,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180612,122017,10,11,3,1,62,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180830,132016,10,3,9,1,62,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180724,052012,10,5,7,1,8,'NO',180,0,'YES');
INSERT INTO SPOTIFY_STREAM VALUES (20180630,052013,10,12,10,3,9,'NO',180,0,'YES');
