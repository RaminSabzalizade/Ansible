# generation of ssh key in server A and pass it to other servers :
```bash
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -C "ramin.sabzalizade@gmail.com"
```

# copy to target servers :
```bash
ssh-copy-id -i ~/.ssh/id_ed25519.pub ramin@192.168.1.12
ssh-copy-id -i ~/.ssh/id_ed25519.pub ramin@192.168.1.13
```