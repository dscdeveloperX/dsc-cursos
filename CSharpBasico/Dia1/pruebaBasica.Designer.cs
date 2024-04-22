
namespace CSharpBasico.Dia1
{
    partial class pruebaBasica
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
            this.lblSaludo = new System.Windows.Forms.Label();
            this.btnEnviarSaludo = new System.Windows.Forms.Button();
            this.tbxNombre = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // lblSaludo
            // 
            this.lblSaludo.AutoSize = true;
            this.lblSaludo.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.lblSaludo.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.lblSaludo.Location = new System.Drawing.Point(167, 74);
            this.lblSaludo.Name = "lblSaludo";
            this.lblSaludo.Size = new System.Drawing.Size(2, 15);
            this.lblSaludo.TabIndex = 0;
            // 
            // btnEnviarSaludo
            // 
            this.btnEnviarSaludo.Location = new System.Drawing.Point(139, 125);
            this.btnEnviarSaludo.Name = "btnEnviarSaludo";
            this.btnEnviarSaludo.Size = new System.Drawing.Size(102, 58);
            this.btnEnviarSaludo.TabIndex = 1;
            this.btnEnviarSaludo.Text = "haz click aqui";
            this.btnEnviarSaludo.UseVisualStyleBackColor = true;
            this.btnEnviarSaludo.Click += new System.EventHandler(this.btnEnviarSaludo_Click);
            // 
            // tbxNombre
            // 
            this.tbxNombre.Location = new System.Drawing.Point(139, 22);
            this.tbxNombre.Name = "tbxNombre";
            this.tbxNombre.Size = new System.Drawing.Size(100, 20);
            this.tbxNombre.TabIndex = 2;
            // 
            // pruebaBasica
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.tbxNombre);
            this.Controls.Add(this.btnEnviarSaludo);
            this.Controls.Add(this.lblSaludo);
            this.Name = "pruebaBasica";
            this.Text = "pruebaBasica";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblSaludo;
        private System.Windows.Forms.Button btnEnviarSaludo;
        private System.Windows.Forms.TextBox tbxNombre;
    }
}