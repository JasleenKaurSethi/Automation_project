s3_bucket="task2-s3bucket"
echo $s3_bucket
apt-get update -y
dpkg --get-selections | grep apache
if [ $? -eq 0 ]
        then
                echo "Apache2 is already installed"
        else
                echo "Installing Apache Server..."
                apt-get install apache2
fi
sudo systemctl status apache2
if [ $? -ne 0 ]
then
        sudo service apache2 start
else
        echo "Apache2 service running"
fi
timestamp=$(date '+%d%m%Y-%H%M%S')
name="Jasleen"
tar_file_name="$name-httpd-logs-$timestamp"
echo $tar_file_name
tar -zcvf $tar_file_name.tar.gz /var/log/apache2/*.log
mv $tar_file_name.tar.gz /tmp
aws s3 cp /tmp/$tar_file_name.tar.gz s3://$s3_bucket/$tar_file_name.tar.gz

