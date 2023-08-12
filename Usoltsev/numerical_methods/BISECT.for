        Subroutine BISECT(A,B,EPSX,EPSF,F,KI, X,FX,NCKL,IER)
C=====================================================================I
C        Подпрограмма для решения нелинейного уравнения F(X)=0        I
C                методом половинного деления (бисекции)               I
C=====================================================================I
C Входные переменные:                                                 I
C---------------------------------------------------------------------I
C    A и B – границы интервала поиска корня;                          I
C     EPSX - абсолютная погрешность нахождения корня;                 I
C     EPSF - абсолютная погрешность невязки левой части уравнения     I
C            с нулем;                                                 I
C        F – имя подпрограммы-функции, вычисляющей значение левой     I
C            части уравнения;                                         I
C       KI – ключ индикации итераций (1 - есть, 0 - нет);             I
C=====================================================================I
C Выходные переменные:                                                I
C---------------------------------------------------------------------I
C        X – значение корня;                                          I
C       FX – значение левой части уравнения от корня;                 I
C     NCKL – число выполненных итераций;                              I
C      IER – код ошибки:                                              I
C            IER=0 - все o'key;                                       I
C            IER=1 – подпрограмма-функция NAME возращает нулевые      I
C                    значения на обеих границах интервала;            I
C            IER=2 – на границах интервала левая часть уравнения      I
C                    имеет одинаковые знаки;                          I
C=====================================================================I
C Примечания:                                                         I
C         1. Левая часть уравнения должна быть оформлена в виде       I
C            подпрограммы-функции, возвращающей значение левой        I
C            части от заданного значения аргумента. Имя этой под-     I
C            программы может быть любым и передается в BISECT через   I
C            список параметров (F – в списке формальных). Это имя     I
C            должно быть описано в вызывающем модуле оператором       I
C            EXTERNAL.                                                I
C=====================================================================I
C            vkolchuzhin: tested with gfortran, 2023-08-12            I
C=====================================================================I
          REAL*8 A,B,EPSX,EPSF,X,FX,X1,X2
          INTEGER LIMIT,NCKL,KI,IER
C		  ********
		  REAL*8 F
C		  ********
        LIMIT=1000
C Обработка ошибочного задания входных данных
        IER=0
        If (F(A).eq.0.0 .and. F(B).eq.0.0) IER=1
        If (F(A)*F(B).gt.0.0) IER=2
        If (IER.ne.0) go to 99
C Начальная установка
        X1=A
        X2=B
        NCKL=0
C Печать заголовка таблицы итераций
        If (KI.ne.1) go to 5
           Print *
           Print *
           Print 3
           Print *
  3        Format(1X,'Nckl',7X,'A',13X,'X',13X,'B',12X,'FX')
  5     Continue
C Начало итерационного цикла
 10     Continue
C Проверка корней на границах диапазона
           If (F(X1).eq.0.0)
     *       Then
               X=X1
               FX=F(X1)
               Go to 99
             Else
           End If
           If (F(X2).eq.0.0)
     *       Then
               X=X2
               FX=F(X2)
               Go to 99
             Else
           End If
           X=(X1+X2)/2.0
           FX=F(X)
C Печать данных итерации
           If (KI.eq.1) Print 1, NCKL,X1,X,X2,FX
  1        Format(1X,I3,2X,4(E12.5,2X))
C Выход из итерационного цикла, если FX=0.0
           If (FX.EQ.0.0) go to 99
C Выход из итерационного цикла, если достигнута точность и по X
C и по F или если число итераций достигло значения LIMIT
           If ( ABS(X2-X1).lt.EPSX
     *        .and. ABS(FX).lt.EPSF
     *        .or. NCKL.eq.LIMIT ) go to 99
C Установка новых границ интервала
           If (F(X1)*FX.lt.0.0) X2=X
           If (F(X2)*FX.lt.0.0) X1=X
           NCKL=NCKL+1
C Конец итерационного цикла
        Go to 10
C Выход из подпрограммы
 99     Continue
        IF (NCKL.eq.LIMIT) IER=3
        Return
        End