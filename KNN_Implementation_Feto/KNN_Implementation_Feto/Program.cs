using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;
namespace KNN_Implementation_Feto
{
    //windows form libaray has been used to openfiledialog
    class Program
    {
        [STAThread]
        static void Main(string[] args)
        {
            //I set default lenght to the array cuz i have only 10 input  if i have unknow i should make the array
            //resizeable
            //b0 الجزاء المقطوع من محور الصدات
            float Slope, B0;
            //عشان تعالج حتت انك تحط الينس بى ايك دى خد الفيل الاول و شوف كام عدد وحطه لنس غير كده لزم تحط الطول بتيدك عشان يطلع صح
            float[] X = new float[1];
            float[] Y= new float[1];
            string[] test0= { };
            Console.WriteLine("Select The File that Contain the data");

            OpenFileDialog fd = new OpenFileDialog()
            {
                Filter = "Text|*.txt"

            };
            string FilePath="";
            if (fd.ShowDialog() == DialogResult.OK)
            {
                FilePath = fd.FileName;
            }
            //For make he select file
            if (FilePath != string.Empty)
            {
                //Skip2 to remove x,y 
                // i want to take the x only in an arry and the y only now
                //test0 =File.ReadAllText(FilePath).Replace('\n',' ').Replace('\r',' ').Trim(' ').Replace(',',' ').Split(' ').Skip(2).ToArray();
                string[] hello = File.ReadAllLines(FilePath);
                //حل مشكلة ان النس كان بيتغير
                X = new float[hello.Length-1];
                Y = new float[hello.Length - 1];
                int counter = 0;
                for (int i = 1; i < hello.Length; i++)
                {
                   string[] temp= hello[i].Split(',').ToArray();
                    X[counter] =float.Parse(temp[0]);
                    Y[counter] =float.Parse(temp[1]);
                    counter++;
                }
            }

            Console.WriteLine("-------------------------------------");
            Console.WriteLine();
            Console.WriteLine("X");
            foreach (var item in X)
            {
                Console.Write(item+" ");
            }
            Console.WriteLine();
            Console.WriteLine("Y");
            foreach (var item in Y)
            {
                Console.Write(item + " ");
            }
            Console.WriteLine();
            Console.WriteLine("Starting the Compution ....");
            #region EquationParamters
            int n = X.Length;
            //Get the sum from the methods
            float SumOfX = X.Sum();
            float SumofY = Y.Sum();
            float SumofSquareX = X.Sum((x) => { return (x * x); });
            float SumOfXY = XYSum(X, Y); //i could perform it with linq aggregate
            float XAverage = X.Average();
            float Yaverage = Y.Average();
            #endregion

            Slope = (n*SumOfXY - (SumOfX * SumofY)) /( n*SumofSquareX - (SumOfX * SumOfX));
            Console.WriteLine("The Equation Slope is ="+Slope);
            B0 = Yaverage - Slope * XAverage;
            Console.WriteLine("B="+B0);
            Console.WriteLine();
            Console.WriteLine("---------------");
            Console.WriteLine($"The Equation of Linear Regression \r-- Y^={Slope}X +{B0}");


            Console.ReadKey();
            #region Old
            ////كود كتيييييييييييييييييييير
            //int countX = 0;
            // int CountY = 0;
            //for (int i = 0; i < test0.Length; i++)
            //{
            //    if (i % 2 == 0)
            //    {
            //       //i use count x so i increase the counter of X by 1 not by the i cuz i may enter 0 2 4 indexs
            //        float temp= float.Parse((test0[i]));
            //        X[countX++] = temp;


            //    }
            //    else
            //    {
            //        float temp = float.Parse((test0[i]));
            //        Y[CountY++] = temp;
            //    }

            //}
            //foreach (var item in test0)
            //{
            //    Console.WriteLine(item);
            //}
            //Console.WriteLine("-------------------------------------");
            //Console.WriteLine();
            //Console.WriteLine("X");
            //foreach (var item in X)
            //{
            //    Console.Write(" "+item);
            //}
            //Console.WriteLine("Y");
            //foreach (var item in Y)
            //{
            //    Console.Write(" " + item);
            //} 
            #endregion


        }
        //i Did those and then remember the linq has what i did :(
        public static float SumofNumbers(float[] Array)
        {
            float sum = 0;
            foreach (float item in Array)
            {
                sum += item;
            }
            return sum;
        }
        public static float SumofSquareNumbers(float[] Array)
        {
            float Xs = 0;
            foreach (float item in Array)
            {
                Xs += (item * item);
            }
            return Xs;
        }
        public static float XYSum(float[] X,float[] Y)
        {
            float XY = 0;
            for (int i = 0; i < X.Length; i++)
            {
                
                XY += X[i]*Y[i];
            }
            return XY;
        }
    }
}
