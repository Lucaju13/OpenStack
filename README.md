# OpenStack

## Solutions Cloud utilisant OpenStack, Ansible, Terraform

### Partie I

- Pour donner les droits au fichier avant de commencer

```cmd
sudo chown test: clouds.yaml
```
1 - Création / Ajout d'une clef ssh dans votre projet

![Alt_text](images/img_p0_1.png)

_**Pour créer une clé je suis allé dans “Paire de clés” et j’ai choisi un type de clé ssh.**_

![Alt_text](images/img_p0_2.png)

**2 - Création Instance, type m1.medium, Image au choix mais sur un volume, security group SSH et Default
Ajout d'une Floating IP (réseau public2) et on se logge en SSH**

![Alt_text](images/img_p0_3.png)

**Groupes de sécurité:**

![Alt_text](images/img_p0_4.png)

**Floating IP:**

![Alt_text](images/img_p1_1.png)

![Alt_text](images/img_p1_2.png)


_**Test de connexion via SSH sur l'adresse public de l'instance crée:**_

![Alt_text](images/img_p1_3.png)

Sur ma machine physique j’ai reussi a me connecter grâce à une clé publique que j’ai généré avec la commande _**ssh-keygen**_. Après la génération de clé publique j’ai importé le fichier lors de la création de mon instance. Ensuite j’ai attaché mon instance à une adresse publique et j’ai réussi à me connecter en ssh.

### Partie II - En utilisant CLI

#### 1. IMPORTANT -> en WebUI créé un "credential applicatif" avec les droits "member" puis télécharger le fichier clouds.yaml. Mettre ce fichier dans le dossier ~/.config/openstack/

![Alt_text](images/img_p2_1.png)



