namespace Camada.Entidade
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Reflection;

    /// <summary>
    /// Entidade Campeonato
    /// </summary>
    public class Campeonato
    {
        #region Atributos
        private Nullable<long> id;
        private String nomeCompleto;
        private String apelido;
        private Nullable<DateTime> dataInicio;
        private Nullable<DateTime> dataFim;
        private Nullable<int> nroClubesInscritos;
        private Confederacao confederacao;
        private IList<FaseCampeonato> fases;
        private IList<InscritoCampeonato> clubesIncritos;
        #endregion

        #region Construtores

        public Campeonato()
        {

        }

        public Campeonato(Nullable<int> id, String nomeCompleto, String apelido, Nullable<DateTime> dataInicio, Nullable<DateTime> dataFim, Nullable<int> nroClubesIncritos, Confederacao confederacao, IList<FaseCampeonato> fases, IList<InscritoCampeonato> clubesInscritos )
        {
            this.id = id;
            this.nomeCompleto = nomeCompleto;
            this.apelido = apelido;
            this.dataInicio = dataInicio;
            this.dataFim = dataFim;
            this.nroClubesInscritos = nroClubesInscritos.Value;
            this.confederacao = confederacao;
            this.fases = fases;
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

        public virtual Nullable<DateTime> DataInicio
        {
            get
            {
                return this.dataInicio.Value;
            }

            set
            {
                this.dataInicio = value;
            }
        }

        public virtual Nullable<DateTime> DataFim
        {
            get
            {
                return this.dataFim.Value;
            }

            set
            {
                this.dataFim = value;
            }
        }

        public virtual Nullable<int> NroClubesInscritos
        {
            get
            {
                return this.nroClubesInscritos.Value;
            }

            set
            {
                this.nroClubesInscritos = value;
            }
        }

        public virtual Confederacao Confederacao
        {
            get
            {
                return this.confederacao;
            }

            set
            {
                this.confederacao = value;
            }
        }

        public virtual IList<FaseCampeonato> Fases
        {
            get
            {
                return this.fases;
            }

            set
            {
                this.fases = value;
            }
        }

       #endregion

        #region Classe Rica

        public override bool Equals(object obj)
        {
            if (obj is Campeonato)
            {
                Campeonato objeto = (Campeonato)obj;

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
