"""
This file was used to automate the renaming of files downloaded with ease
"""
import os

#  os.getcwd()

# Enter the directory of the files to change
# change the required directory
working_dir = ''
os.chdir(working_dir)

# for all file in this current directory
for doc in os.listdir():

    #  using the os.path.splitext() to split the file_name from the extension
    file_name, file_ext = os.path.splitext(doc)

    # spliting the file_name and converting to a list, to remove any dot in the name
    split_file_name = file_name.split('.')

    # removing the beginning and the end of the filename
    split_file_name = split_file_name[1:-1]

    # joining the new list to form a string for the file_name
    new_name = ' '.join(split_file_name)

    # Joining the filename with the extension
    new_name_with_ext = '{}{}'.format(new_name, file_ext)

    # to rename the files uncomment the line below
    os.rename(doc, new_name_with_ext)
