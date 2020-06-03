 #!/bin/bash
tree / -L 1
sudo touch /test.txt
echo "create succeed !"
tree / -L 1
sudo rm /test.txt
echo "rm succeed !"
tree / -L 1
