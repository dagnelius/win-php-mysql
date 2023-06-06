$PHP_8_2_6_THREAD_SAFE_X64_URL = 'https://windows.php.net/downloads/releases/php-8.2.6-Win32-vs16-x64.zip'
$MYSQL_8_0_33_X64_URL = 'https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-8.0.33-winx64.zip'

$PHP_ZIP_PATH = 'C:\.php-8.2.6.zip'
$MYSQL_ZIP_PATH = 'C:\.mysql-8.0.33.zip'

$PHP_DIR_PATH = 'C:\php-8.2.6'
$MYSQL_DIR_PATH = 'C:\mysql-8.0.33'

$SYSTEM_PATH_USER = ([Environment]::GetEnvironmentVariable("Path", "User"))
$NEW_SYSTEM_PATH_USER = $SYSTEM_PATH_USER + $PHP_DIR_PATH + ';' + $MYSQL_DIR_PATH + ';'

# Download PHP and MySql
Invoke-WebRequest -URI $PHP_8_2_6_THREAD_SAFE_X64_URL -OutFile $PHP_ZIP_PATH
Invoke-WebRequest -URI $MYSQL_8_0_33_X64_URL -OutFile $MYSQL_ZIP_PATH

# Unarchive ZIP Files
Expand-Archive $PHP_ZIP_PATH -DestinationPath $PHP_DIR_PATH
Expand-Archive $MYSQL_ZIP_PATH -DestinationPath $MYSQL_DIR_PATH

# Update Path Scope: User
[Environment]::SetEnvironmentVariable("Path", $NEW_SYSTEM_PATH_USER, [System.EnvironmentVariableTarget]::User)