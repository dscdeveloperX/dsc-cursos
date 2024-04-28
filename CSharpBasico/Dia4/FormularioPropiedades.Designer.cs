
namespace CSharpBasico.Dia4
{
    partial class FormularioPropiedades
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnLlamada1 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnLlamada1
            // 
            this.btnLlamada1.Location = new System.Drawing.Point(99, 131);
            this.btnLlamada1.Name = "btnLlamada1";
            this.btnLlamada1.Size = new System.Drawing.Size(75, 23);
            this.btnLlamada1.TabIndex = 0;
            this.btnLlamada1.Text = "llamda1";
            this.btnLlamada1.UseVisualStyleBackColor = true;
            this.btnLlamada1.Click += new System.EventHandler(this.btnLlamada1_Click);
            // 
            // FormularioPropiedades
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnLlamada1);
            this.Name = "FormularioPropiedades";
            this.Text = "FormularioPropiedades";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnLlamada1;
    }
}