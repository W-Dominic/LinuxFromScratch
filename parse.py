if __name__ == "__main__":
    f1 = open("package_files.csv").read().splitlines()
    f2 = open("packages.csv", "w")
    dir_names = []
    for line in f1:
        n = line.split(".tar")
        dir_names.append(n[0])
        f2.write(f"{line} {n[0]}\n")
    
    print(dir_names)
    print(len(dir_names))

    f2.close()