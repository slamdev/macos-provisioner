# macos-provisioner

Run to install third-party dependencies:

```shell
ansible-galaxy install -r requirements.yaml
```

Create **hosts.yaml** file based on **hosts-example.yaml**

Create **config.yaml** file and override configs from **default.config.yaml**

Run ansible playbook:

```shell
ansible-playbook main.yaml
```

Configure **Google Drive** app:

1. Connect it to the target account in app settings
2. Go to **Google Drive** location in **Finder** and enable offline access to "Other Computers/My IMac"

Then run the second ansible playbook:

```shell
ansible-playbook sync-gdrive.yaml
```
