%Alessandro Ottino

%scra_chunk_80
clc
clear all
for a = 1:130  
        s= ['scra_chunk_' num2str(a) '']; %set the file to open
        a=fopen(s,'r');%open the file only for reading
        readfile1=fread(a,'int32');%read it in int32 format
        e1=find(readfile1>12 & readfile1<384);%create a matrix of only the values that are bigger than 12 and smaller than 384
        fclose(a);%close the file
        a=fopen(s,'r');%open the file only for reading
        readfile2=fread(a,'single');%read it in single format
        e2=find(readfile2>12 & readfile2<384);%create a matrix of only the values that are bigger than 12 and smaller than 384
        fclose(a);%close the file
        a=fopen(s,'r');%open the file only for reading
        readfile3=fread(a,'double');%read it in double format
        e3=find(readfile3>12 & readfile3<384);%create a matrix of only the values that are bigger than 12 and smaller than 384
        fclose(a);%close the file

        if size(e1)== size(readfile1)%if the size of the the matrix e1 (made from the values of readfile1 between 12 an 384)is equal to the size of readfile1
            readfile=readfile1;%means that readfile1 is in the right format so my readfile will be equal to readfile1
        else if size(e2)== size(readfile2)%if not try the same thing with e2 and readfile2
            readfile=readfile2;
            else if size(e3)== size(readfile3)%if not try the same thing with e2 and readfile2
                        readfile=readfile3;
                else readfile=[];%if not readfile is an empty matrix
                end
            end
        end

        h=[];%i create an empty matrix

         for n= 12:1:128%create a for loop for all the possible values of the offset
                if size(strfind(transpose(char(readfile-n)),' the'))~=size(h)%first i transform readfile-n(the possible offset)in characters then transpose the matrix and find an array corresponding to the time the word ' the' is thresent in the string
                g=(readfile-n);%then say that if the size of this array is different to an empty matrix it means that the word ' the' is present and it is the right value of the offset
                z=g';%set g as the value without offset and transpose it into z
                char(z)%the solution will be the transformation in characters of the array z
                else g=[];%if not g will be equal to an empty matrix
                end
         end

         %at the end this program will only let show the correct text


end
