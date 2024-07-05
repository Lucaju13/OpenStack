# OpenStack

## Solutions Cloud utilisant OpenStack, Ansible, Terraform

### Partie I

- Pour donner les droits au fichier avant de commencer

```cmd
sudo chown test: clouds.yaml
```
1 - Création / Ajout d'une clef ssh dans votre projet

![Alt_text](images/img_p0_1.png)

Pour créer une clé je suis allé dans “Paire de clés” et j’ai choisi un type de clé ssh.

![Alt_text](images/img_p0_2.png)

2 - Création Instance, type m1.medium, Image au choix mais sur un volume, security group SSH et Default
Ajout d'une Floating IP (réseau public2) et on se logge en SSH

![Alt_text](images/img_p0_3.png)

*Groupes de sécurité:*

![Alt_text](images/img_p0_4.png)

*Floating IP:*

![Alt_text](images/img_p1_1.png)

![Alt_text](images/img_p1_2.png)
