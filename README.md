# macos-provisioner

Run to install third-party dependencies:

```shell
ansible-galaxy install -r requirements.yaml
```

Create **hosts.yaml** file based on **hosts-example.yaml**

Create **config.yaml** file and override configs from **default.config.yaml**

In a new mac, before running the playbook:

1. go to **System Settings** -> **General** -> **Sharing**
    - edit "Local hostname"
    - enable "Remote Login"
2. open terminal and run: `python3` and click "Install"
3. Open "App Store" (so we can rely on `mas` to install the apps)

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
