// -----------------------------------------------------------------------
// <copyright file="Clube.cs" company="CS Services Consultoria em Sistemas">
// TODO: Update copyright text.
// </copyright>
// -----------------------------------------------------------------------

namespace Camada.Entidade
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Reflection;

    /// <summary>
    /// Entidade Clube
    /// </summary>
    public class Clube
    {
        #region Atributos

        private Nullable<long> id;
        private String nomeCompleto;
        private String apelido;
        private String distintivo;
        private DateTime dataFundacao;
        private Estadio estadio;
        private IList<ClubeTitulo> titulos;
        private IList<InscritoCampeonato> inscricoes;
        //private IList<Campeonato> campeonatos;
        
        #endregion

        #region Construtores
        public Clube()
        {

        }

        public Clube(Nullable<long> id, String nomeCompleto, String apelido, String distintivo, DateTime dataFundacao, Estadio estadio, IList<ClubeTitulo> titulos, IList<InscritoCampeonato> inscricoes)
        {
            this.id = id;
            this.nomeCompleto = nomeCompleto;
            this.apelido = apelido;
            this.distintivo = distintivo;
            this.dataFundacao = dataFundacao;
            this.estadio = estadio;
            this.titulos = titulos;
            this.inscricoes = inscricoes;
        }
        #endregion

        #region Propriedades

        public virtual Nullable<long> Id
        {
            get
            {
                return this.id;
            }

            set
            {
                this.id = value;
            }
        }

        public virtual String NomeCompleto
        {
            get
            {
                return this.nomeCompleto;
            }

            set
            {
                this.nomeCompleto = value;
            }
        }

        public virtual String Apelido
        {
            get
            {
                return this.apelido;
            }

            set
            {
                this.apelido = value;
            }
        }

        public virtual String Distintivo
        {
            get
            {
                return this.distintivo;
            }

            set
            {
                this.distintivo = value;
            }
        }

        public virtual DateTime DataFundacao
        {
            get
            {
                return this.dataFundacao;
            }

            set {
                this.dataFundacao = value;
            }
        }

        public virtual Estadio Estadio
        {
            get
            {
                return this.estadio;
            }

            set
            {
                this.estadio = value;
            }
        }

        public virtual IList<ClubeTitulo> Titulos
        {
            get
            {
                return this.titulos;
            }

            set
            {
                this.titulos = value;
            }
        }

        public virtual IList<InscritoCampeonato> Inscricoes
        {
            get
            {
                return this.inscricoes;
            }

            set
            {
                this.inscricoes = value;
            }
        }

        #endregion

        #region Classe Rica

        public override bool Equals(object obj)
        {
            if (obj is Clube)
            {
                Clube objeto = (Clube)obj;

                if (objeto.Id != null && this.id != null)
                {
                    return objeto.Id.Equals(this.id);
                }
            }

            return false;
        }

        public override string ToString()
        {
            FieldInfo[] atributos;
            atributos = GetType().GetFields(BindingFlags.NonPublic);
            return atributos.ToString();
        }

        public override int GetHashCode()
        {
            return this.id.HasValue ? this.id.GetHashCode() : 0;
        }

        #endregion
    }
}
