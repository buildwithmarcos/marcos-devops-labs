# Week 1 – Git & GitHub Basics

This file was created successfully using a short safe block.

## 🎯 Goals

- Get comfortable with local Git commands
- Understand how GitHub fits into the workflow
- Practice making branches, commits, and pull requests


## 🧠 Mental Model

- **Git** = your local version control tool (history, branches, commits)
- **GitHub** = the remote server that stores your repo online
- **Branch** = a line of development
- **Commit** = a snapshot of your changes
- **Pull Request (PR)** = a proposal to merge a branch into another


## 🛠 Setup & Identity

Check who Git thinks you are:

\`\`\`sh
git config --global user.name
git config --global user.email
\`\`\`

If needed, set your identity:

\`\`\`sh
git config --global user.name "Marcos Alonso"
git config --global user.email "marcos.alonso@me.com"
\`\`\`

These values appear on every commit you make.


## 📂 Core Commands (Cheat Sheet)

### 🔍 Status & History

\`\`\`sh
git status                      # See what changed, staged, or untracked
git log --oneline               # Compact history
git log --oneline --graph --all # Visual graph of branches
\`\`\`

### 📝 Adding & Committing Changes

\`\`\`sh
git add <file>                  # Stage a single file
git add .                       # Stage everything changed
git commit -m "message"         # Commit staged changes
\`\`\`

### 💬 Commit Message Prefixes

- \`feat:\` – new feature or content  
- \`fix:\` – bug fix  
- \`docs:\` – documentation / notes  
- \`chore:\` – cleanup, config, misc  

Example:

\`\`\`sh
git commit -m "docs: add git basics notes for week 1"
\`\`\`


## 🌿 Branching Workflow

### Create a new branch

\`\`\`sh
git checkout -b feature/week-01-notes
\`\`\`

### Switch between branches

\`\`\`sh
git checkout main
git checkout feature/week-01-notes
\`\`\`

### List branches

\`\`\`sh
git branch
\`\`\`

### Delete a local branch (after it’s merged)

\`\`\`sh
git branch -d feature/week-01-notes
\`\`\`

Branches let you do work safely without touching \`main\`.


## ☁️ Working With GitHub (Remote)

### View your remotes

\`\`\`sh
git remote -v
\`\`\`

### Push a new branch to GitHub

\`\`\`sh
git push -u origin feature/week-01-notes
\`\`\`

The \`-u\` flag sets the upstream, so future pushes only need:

\`\`\`sh
git push
\`\`\`

### Update your local main branch

\`\`\`sh
git checkout main
git pull
\`\`\`

### Sync your branch with main (optional but useful)

\`\`\`sh
git checkout feature/week-01-notes
git rebase main
\`\`\`

This keeps your branch clean and up to date.


## 🔁 Typical DevOps Workflow (My Weekly Flow)

This is the workflow I'm practicing during Week 1 to build real muscle memory.

### 1️⃣ Start from a clean main branch

\`\`\`sh
git checkout main
git pull
\`\`\`

### 2️⃣ Create a feature branch for the work

\`\`\`sh
git checkout -b feature/week-01-notes
\`\`\`

### 3️⃣ Make changes (edit files, add notes, update labs)

After editing files:

\`\`\`sh
git add notes/git-basics.md
git commit -m "docs: add git basics notes for week 1"
\`\`\`

### 4️⃣ Push the branch to GitHub

\`\`\`sh
git push -u origin feature/week-01-notes
\`\`\`

### 5️⃣ Open a Pull Request (PR)

On GitHub:

1. Compare `feature/week-01-notes` → `main`
2. Review changes
3. Merge PR  
4. Delete branch on GitHub

### 6️⃣ Sync your local main branch

\`\`\`sh
git checkout main
git pull
\`\`\`

### 7️⃣ Clean up local feature branches

\`\`\`sh
git branch -d feature/week-01-notes
\`\`\`

Repeat this workflow for every new week or topic — clean, safe, and very DevOps-friendly.


## ✅ Week 1 Outcomes

By the end of Week 1, I should be able to:

- Create and switch between branches confidently  
- Stage and commit changes with meaningful messages  
- Push new branches to GitHub and set upstream tracking  
- Open and merge Pull Requests  
- Keep `main` in sync with remote changes  
- Delete feature branches safely after merging  
- Understand the difference between Git (local) and GitHub (remote)  
- Recover from common Git problems without getting stuck  

This completes the Week 1 Git & GitHub fundamentals module.
