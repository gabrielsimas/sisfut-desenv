// -----------------------------------------------------------------------
// <copyright file="Confonto.cs" company="CS Services Consultoria em Sistemas">
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
    /// Estados dos Confrontos
    /// </summary>
    public enum EstadoConfronto {
        NaoIniciado = 0,
        EmAndamento = 1,
        Encerrado = 2    
    }

    /// <summary>
    // Entidade Confronto
    /// </summary>
    public class Confronto
    {
        #region atributos
        private Nullable<long> id;
        private Nullable<int> golVisitante;
        private Nullable<int> golMandante;
        private EstadoConfronto estado;
        private Rodada rodada;
        private Estadio estadio;
        private InscritoCampeonato mandante;
        private InscritoCampeonato visitante;

        #endregion

        #region Construtores
        public Confronto()
        {

        }

        public Confronto(Nullable<long> id, Nullable<int> golVisitante, Nullable<int> golMandante,EstadoConfronto estado, Rodada rodada, Estadio estadio, InscritoCampeonato mandante, InscritoCampeonato visitante)
        {
            this.id = id.Value;
            this.golMandante = golVisitante.Value;
            this.golMandante = golMandante.Value;
            this.estado = estado;
            this.rodada = rodada;
            this.estadio = estadio;
            this.mandante = mandante;
            this.visitante = visitante;
        }
        #endregion

        #region Propriedades
        public virtual Nullable<long> Id
        {
            get
            {
                return this.id.Value;
            }

            set
            {
                this.id = value;
            }
        }

        public virtual Nullable<int> GolVisitante
        {
            get
            {
                return this.golVisitante.Value;
            }

            set
            {
                this.golVisitante = value;
            }
        }

        public virtual Nullable<int> GolMandante
        {
            get
            {
                return this.golMandante.Value;
            }

            set
            {
                this.golMandante = value;
            }
        }

        public virtual EstadoConfronto Estado
        {
            get
            {
                return this.estado;
            }

            set
            {
                this.estado = value;
            }
        }

        public virtual Rodada Rodada
        {
            get
            {
                return this.rodada;
            }

            set
            {
                this.rodada = value;
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

        public virtual InscritoCampeonato Mandante
        {
            get
            {
                return this.mandante;
            }

            set
            {
                this.mandante = value;
            }
        }

        public virtual InscritoCampeonato Visitante
        {
            get
            {
                return this.visitante;
            }

            set
            {
                this.visitante = value;
            }
        }
        #endregion

        #region Classe Rica

        public override bool Equals(object obj)
        {
            if (obj is Confronto)
            {
                Confronto objeto = (Confronto)obj;

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
