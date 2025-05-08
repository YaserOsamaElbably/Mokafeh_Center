                            -- Create database
DROP DATABASE IF EXISTS مكافح;
CREATE DATABASE مكافح;
USE مكافح;

-- Create tables
CREATE TABLE التاريخ (
    المعرف INT PRIMARY KEY, -- مفتاح فريد يمثل التاريخ بصيغة YYYYMMDD
    التاريخ_الكامل DATE NOT NULL, -- التاريخ الكامل
    اليوم INT NOT NULL, -- اليوم (1 - 31)
    الشهر INT NOT NULL, -- الشهر (1 - 12)
    اسم_الشهر VARCHAR(20) NOT NULL, -- اسم الشهر (يناير، فبراير...)
    الربع INT NOT NULL, -- الربع (1 - 4)
    السنة INT NOT NULL, -- السنة
    رقم_الإسبوع_في_السنة INT NOT NULL, -- رقم الأسبوع في السنة
    اسم_اليوم VARCHAR(20) NOT NULL, -- اسم اليوم (الأحد، الاثنين...)
    هل_هو_عطلة_نهاية_الأسبوع BIT NOT NULL, -- مؤشر لعطلة نهاية الأسبوع (1 = نعم، 0 = لا)
    هل_هو_عطلة BIT NOT NULL -- مؤشر إذا كان اليوم عطلة (1 = نعم، 0 = لا)
);

CREATE TABLE الجهات (
  المعرف INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  الاسم VARCHAR(30) NOT NULL
);

CREATE TABLE العملاء (
  المعرف INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  الاسم VARCHAR(20) NOT NULL
);

CREATE TABLE الموظفين (
  المعرف INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  الاسم_الأول VARCHAR(15) NOT NULL,
  اللقب VARCHAR(15),
  القسم VARCHAR(25),
  اسم_المستخدم VARCHAR(25),
  كلمة_المرور VARCHAR(30),
  البريد_الإليكتروني VARCHAR(50),
  رقم_الهاتف VARCHAR(15),
  تاريخ_الإنشاء TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  تاريخ_التحديث TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  تاريخ_الميلاد DATE,
  النوع VARCHAR(6),
  UNIQUE (البريد_الإليكتروني),
  UNIQUE (رقم_الهاتف),
  UNIQUE (اسم_المستخدم)
);

CREATE TABLE العمليات_المالية (
  رقم_العملية INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  تاريخ_العملية INT NOT NULL DEFAULT CURRENT_DATE,
  تاريخ_الإنشاء TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  معرف_الموظف INT NOT NULL,
  النوع ENUM('صادر', 'وارد') DEFAULT 'صادر',
  معرف_الجهة INT NOT NULL,
  معرف_العميل INT,
  معرف_الموظف_المسجل INT,
  البيان VARCHAR(100),
  القيمة FLOAT NOT NULL,
  FOREIGN KEY (تاريخ_العملية) REFERENCES التاريخ(المعرف),
  FOREIGN KEY (معرف_الموظف) REFERENCES الموظفين(المعرف),
  FOREIGN KEY (معرف_الجهة) REFERENCES الجهات(المعرف),
  FOREIGN KEY (معرف_العميل) REFERENCES العملاء(المعرف),
  FOREIGN KEY (معرف_الموظف_المسجل) REFERENCES الموظفين(المعرف)
);


-- Create Users
CREATE USER IF NOT EXISTS 'Ser'@'%' IDENTIFIED BY 'q123456W#'; -- DBA
CREATE USER IF NOT EXISTS 'mokafeh1'@'localhost' IDENTIFIED BY '2846159'; -- Manager
CREATE USER IF NOT EXISTS 'mokafeh2'@'localhost' IDENTIFIED BY '1937456'; -- Data Entry


-- Granting Privileges
GRANT ALL PRIVILEGES ON مكافح.* TO 'Ser'@'%'; -- DBA
GRANT SELECT, INSERT, DELETE, UPDATE ON مكافح.* TO 'mokafeh1'@'localhost'; -- Manager
GRANT INSERT ON العمليات.* TO 'mokafeh2'@'localhost'; -- Data Entry



