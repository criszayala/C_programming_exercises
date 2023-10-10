/*Sumad los cuatro números que nos han dado y dividid el resultado
de esta suma por cuatro para obtener el resultado final*/

algoritmo media
        var
            n, suma, i: entero;
            resultado: real;
        fvar
        suma := 0; 
        i := 1;
        mientras i ≤ 4 hacer
            leerEntero(n);
            suma := suma + n;
            i := i + 1
        fmientras
        resultado := enteroAReal(suma)/4.0;
        escribirReal(resultado)
falgoritmo