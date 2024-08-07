# Backing it all up 

Everyone knows the 3-2-1 rule for backups, but very few people follow it thoroughly - you need at least 3 copies, they should be at least in two different media, and at least one should be in a different physical location.

In my particular setup, copies are made on demand, usually every time I make changes. For work there's a total of three copies: the working copy, the copy on the home NAS, and the GitHub repository. For the system core I keep Timeshift copies, but I don't bother to copy the system on the cloud. My dotfiles should make the job. 

Using git for the remote backup is a good idea for text and code. You get versioning, plus all the goodies involved - commit history, branching, issues, etc.
Starting it up is fairly easy, but in the latest years Github has ditched the simple password security, and you need to use something like ssh.
I'm here copying an [article by Hamza Ghufran](https://www.hatica.io/blog/how-to-configure-github-ssh-keys/).

Working with GitHub is an essential part of every developer's toolkit, but keeping your repositories secure is just as important. One way to achieve this is by using SSH
keys to establish a secure connection between your local machine and the GitHub server. This article will guide you through the process of setting up and configuring
GitHub SSH keys, ensuring that your projects remain safe and sound.

Before diving into the configuration process, make sure you have a basic understanding of Git and GitHub. You'll also need a GitHub account and Git installed on your local
machine. If you haven't done this yet, head over to the GitHub website and follow their instructions to get started.

## How to Configure GitHub SSH Keys?

Here is a step-by-step guide on configuring GitHub SSH Keys:

### Step 1: Generate an SSH key pair

SSH keys are composed of two parts: a public key and a private key. The public key is shared with the server (in this case, GitHub), while the private key remains on your
local machine. To generate a new SSH key pair, follow these steps:

  • Open a terminal or command prompt on your computer.

  • Enter the following command:

`ssh-keygen -t ed25519 -C "your_email@example.com"`

Replace "your_email@example.com" with your GitHub email address. You can also use the RSA algorithm by replacing "ed25519" with "rsa" in the command.

  • When prompted, choose a file location for the keys or hit Enter to accept the default location.

  • Optionally, you can set a passphrase to protect the private key. If you don't want to set a passphrase, leave the field blank and press Enter.

### Step 2: Add the public SSH key to GitHub

Now that you've generated an SSH key pair, it's time to add the public key to your GitHub account. Here's how:

  • Locate the public key file (usually named "id_ed25519.pub" or "id_rsa.pub") in the directory specified during key generation.

  • Open the file with a text editor and copy its entire content.

  • Log in to your GitHub account and navigate to the SSH key settings by clicking on your profile picture, then selecting "Settings" followed by "SSH and GPG keys."

  • Click the "New SSH key" button, paste the copied public key into the "Key" field, and provide a descriptive title to help you identify this key in the future.

  • Click "Add SSH key" to save the new key to your GitHub account.

### Step 3: Configure the local Git repository to use SSH

With the public key added to GitHub, it's time to configure your local Git repository to use SSH.

If you're cloning a new repository, find the SSH clone URL on the repository's main page on GitHub, then use the git clone command with the URL:

`git clone git@github.com:username/repo.git`

If you have an existing repository using HTTPS, you can switch to SSH by running the following commands:

`git remote -v`

`git remote set-url origin git@github.com:username/repo.git`

Replace "username" and "repo" with the appropriate values.

### Step 4: Test the SSH connection

To verify that your SSH connection is set up correctly, follow these steps:

Ensure that the SSH agent is running by entering the command:

`eval "$(ssh-agent -s)"`

Add the private key to the SSH agent with the following command:

`ssh-add ~/.ssh/id_ed25519`

Replace "id_ed25519" with "id_rsa" if you used the RSA algorithm.

Test the connection using the git ls-remote command:

`git ls-remote git@github.com:username/repo.git`

Replace "username" and "repo" with the appropriate values. If the connection is successful, you should see a list of references in the remote repository.

## Conclusion

Configuring GitHub SSH keys is an important step to ensure the security of your repositories. By following this guide, you've generated an SSH key pair, added the public
key to your GitHub account, and configured your local Git repository to use SSH. 

Regularly update your SSH keys and use unique keys for different services to further improve your security posture. By doing so, you can minimize the impact in case a key
is compromised. Adopting secure practices when using Git and GitHub not only keeps your projects safe but also instills confidence in your collaborators.
